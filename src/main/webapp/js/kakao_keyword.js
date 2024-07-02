var markers = [];
var mapContainer = document.getElementById('map');
var mapOption = {
	center: new kakao.maps.LatLng(37.566826, 126.9786567),
	level: 3
};
var map = new kakao.maps.Map(mapContainer, mapOption);
var ps = new kakao.maps.services.Places();
var infowindow;
var selectLocation;

document.addEventListener("DOMContentLoaded", function() {
	searchPlaces();
});

function searchPlaces() {
	var keyword = document.getElementById('keyword').value.trim();

	if (!keyword) {
		alert('키워드를 입력해주세요!');
		return false;
	}

	ps.keywordSearch(keyword, placesSearchCB);
}

function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		displayPlaces(data);
		displayPagination(pagination);
	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		alert('검색 결과가 존재하지 않습니다.');
	} else if (status === kakao.maps.services.Status.ERROR) {
		alert('검색 결과 중 오류가 발생했습니다.');
	}
}

function displayPlaces(places) {
	var listEl = document.getElementById('placesList');
	var menuEl = document.getElementById('menu_wrap');
	var fragment = document.createDocumentFragment();
	var bounds = new kakao.maps.LatLngBounds();

	removeAllChildNods(listEl);
	removeMarker();

	places.forEach(function(place, index) {
		var placePosition = new kakao.maps.LatLng(place.y, place.x);
		var marker = addMarker(placePosition, index);
		var itemEl = getListItem(index, place);

		bounds.extend(placePosition);

		marker.addListener('mouseover', function() {
			displayInfowindow(marker, place.place_name);
		});

		marker.addListener('click', function() {
			addLocationDiv(place);
		});

		marker.addListener('mouseout', function() {
			infowindow.close();
		});

		itemEl.addEventListener("mouseover", function() {
			displayInfowindow(marker, place.place_name);
		});

		itemEl.addEventListener("mouseout", function() {
			infowindow.close();
		});

		fragment.appendChild(itemEl);
	});

	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	map.setBounds(bounds);
}

function getListItem(index, place) {
	var el = document.createElement('li');
	var itemStr = `<span class="markerbg marker_${index + 1}"></span>
                    <div class="info">
                    <h5>${place.place_name}</h5>`;

	if (place.road_address_name) {
		itemStr += `    <span>${place.road_address_name}</span>
                       <span class="jibun gray">${place.address_name}</span>`;
	} else {
		itemStr += `    <span>${place.address_name}</span>`;
	}

	itemStr += `  <span class="tel">${place.phone}</span>
                    </div>`;

	el.innerHTML = itemStr;
	el.className = 'item';
	el.addEventListener("click", function() {
		addLocationDiv(place);
	});

	return el;
}

function addLocationDiv(place) {
	var locationHtml = `<div class="card mt-3">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col-1">
                                    <i class="bi bi-geo-alt-fill fa-2x"></i>
                                </div>
                                <div class="col ms-3">
                                    <div class="font-weight-bold text-success text-uppercase mb-1">
                                        ${place.place_name} </div>
                                        
                                    <div class="text-black-50 font-weight-bold small">${place.road_address_name}</div>
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-lg btn-transparent" onclick="deleteLocation();">
                                        <i class="bi bi-x-square"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>`;

	selectLocation = {
		id: place.id,
		placeName: place.place_name,
		roadAddressName: place.road_address_name,
		placeUrl: place.place_url,
		latitude: place.y,
		longitude: place.x
	};

	var locateDiv = document.getElementById('locateDiv');
	locateDiv.innerHTML = locationHtml;

	var locateOffset = locateDiv.offsetTop;
	window.scrollTo({
		top: locateOffset,
		behavior: 'smooth'
	});

	locateDiv.classList.add('blinking');
	setTimeout(function() {
		locateDiv.classList.remove('blinking');
	}, 1000);

	document.getElementById('placeName').value = place.place_name;
	document.getElementById('roadAddressName').value = place.road_address_name;

}

function deleteLocation() {
	document.getElementById('locateDiv').innerHTML = '';
	selectLocation = undefined;
}

function addMarker(position, idx) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
	var imageSize = new kakao.maps.Size(36, 37);
	var imgOptions = {
		spriteSize: new kakao.maps.Size(36, 691),
		spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
		offset: new kakao.maps.Point(13, 37)
	};

	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	var marker = new kakao.maps.Marker({
		position: position,
		image: markerImage
	});

	marker.setMap(map);
	markers.push(marker);

	return marker;
}

function removeMarker() {
	markers.forEach(function(marker) {
		marker.setMap(null);
	});
	markers = [];
}

function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination');
	removeAllChildNods(paginationEl);

	for (var i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}

		paginationEl.appendChild(el);
	}
}

function displayInfowindow(marker, title) {
	if (infowindow) {
		infowindow.close();
		infowindow = null;
	}

	infowindow = new kakao.maps.InfoWindow({
		position: marker.getPosition(),
		content: `<span class="info-title">${title}</span>`
	});

	infowindow.open(map, marker);
	infoWindowStyle();
}

function infoWindowStyle() {
	var infoTitle = document.querySelectorAll('.info-title');

	infoTitle.forEach(function(e) {
		var w = e.offsetWidth + 10;
		var ml = w / 2;
		e.parentElement.style.top = "75px";
		e.parentElement.style.left = "50%";
		e.parentElement.style.marginLeft = -ml + "px";
		e.parentElement.style.width = w + "px";
		e.parentElement.previousSibling.style.display = "none";
		e.parentElement.parentElement.style.border =
			"0px";
		e.parentElement.parentElement.style.background = "unset";
	});
}

function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}

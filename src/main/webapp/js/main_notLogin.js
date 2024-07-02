
document.addEventListener('DOMContentLoaded', function() {
	insertKakaoMap();
	settingWorldCupCardNon();

	document.querySelectorAll('.open-login-modal').forEach(function(element) {
		element.addEventListener('click', function() {
			var loginModal = new bootstrap.Modal(document.getElementById('loginModal'));
			loginModal.show();
		});
	});
});

function insertKakaoMap() {
	var mapContainer = document.getElementById('map'),
		mapOption = {
			center: new kakao.maps.LatLng(36.706832, 127.965814),
			level: 13
		};

	var map = new kakao.maps.Map(mapContainer, mapOption);
	// Static list of markers
	var markerList = [
		{ latitude: 37.886603268, longitude: 127.7401514624, name: "한림대 CLC 앞 공연 중!", mapUrl: "http://place.map.kakao.com/8134162" },
		{ latitude: 37.868813, longitude: 127.743432, name: "강원대에서는 소규모 공연!", mapUrl: "http://place.map.kakao.com/10124518" },
		{ latitude: 37.572774790, longitude: 126.976109, name: "스튜디오 지브리 타카하타 이사오선", mapUrl: "http://place.map.kakao.com/8373453" },
		{ latitude: 37.55752852128792, longitude: 126.9359986, name: "wu or die", mapUrl: "http://place.map.kakao.com/10124518" },
		{ latitude: 37.569201, longitude: 126.916043, name: "Alchemonic 16", mapUrl: "http://place.map.kakao.com/2032560866" },
		{ latitude: 37.557788356, longitude: 126.925815, name: "이토준지 호러하우스!", mapUrl: "http://place.map.kakao.com/1255204327" },

	];
	insertMapMarker(markerList, map);
}

function insertMapMarker(markerList, map) {
	if (markerList != null && markerList != undefined) {
		markerList.forEach(function(marker) {
			var imgSrc = '../images/map_marker.png',
				imgSize = new kakao.maps.Size(30, 30),
				imgOption = { offset: new kakao.maps.Point(0, 0) };

			var markerImage = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption),
				markerPosition = new kakao.maps.LatLng(marker.latitude, marker.longitude);

			var markerTip = new kakao.maps.Marker({
				position: markerPosition,
				image: markerImage
			});
			markerTip.setMap(map);

			var content = `<div class="customoverlay">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">
                                        <span class="title">${marker.name} 행사 중 !</span>
                                    </a>
                                   </div>`;

			var customOverlay = new kakao.maps.CustomOverlay({
				map: map,
				position: markerPosition,
				content: content,
				yAnchor: 1
			});
		});
	}
}




document.addEventListener('DOMContentLoaded', function() {
	insertKakaoMap();
	getWorldcupInfo();
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
		{ latitude: 37.557788356, longitude: 126.925815, name: "이토준지 호러하우스!", mapUrl: "http://place.map.kakao.com/1255204327" }


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

			// Add event listener for marker click to zoom in
			kakao.maps.event.addListener(markerTip, 'click', function() {
				map.setCenter(markerPosition);
				map.setLevel(5);  // Zoom level, adjust as needed
			});

			var content = `<div class="customoverlay">
                                <a href="${marker.mapUrl}" target="_blank">
                                    <span class="title">${marker.name} </span>
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



function registerMsg() {


	const msgTitle = document.getElementById('msgTitle').value;
	const colorInput = document.getElementById('colorInput').value;
	const msgContent = document.getElementById('msgTextarea').value;

	if (msgTitle.length < 1 || msgTitle.length > 15) {
		alert("제목은 15자 이내로 입력해주세요.");
		return;
	}
	if (!colorInput) {
		alert("색상을 설정해주세요.");
		return;
	}
	if (msgContent.length < 1 || msgContent.length > 40) {
		alert("내용은 40자 이내로 입력해주세요.");
		return;
	}

	// 새로운 메시지 요소 생성
	const messageElement = document.createElement('div');
	messageElement.className = 'text-white-50 small';
	messageElement.style.backgroundColor = ` ${colorInput}`;
	messageElement.innerHTML = `
                
                    <p class="fs-5">${msgTitle}</p>
                    <p>${msgContent}</p>
                
            `;

	// 메시지 컨테이너에 추가
	document.getElementById('messageContainer').appendChild(messageElement);

	// 모달 닫기
	const modal = document.getElementById('inputMsgModal');
	const bootstrapModal = bootstrap.Modal.getInstance(modal);
	bootstrapModal.hide();

	// 폼 초기화
	document.getElementById('msgTitle').value = '';
	document.getElementById('colorInput').value = '#8E700C';
	document.getElementById('msgTextarea').value = '';
}

// 취소 버튼 클릭 시 실행되는 함수
document.getElementById('cancelBtn').addEventListener('click', function() {
	const modal = document.getElementById('inputMsgModal');
	const bootstrapModal = bootstrap.Modal.getInstance(modal);
	bootstrapModal.hide();
});

// Bootstrap 모달 초기화
document.addEventListener('DOMContentLoaded', function() {
	const modalElement = document.getElementById('inputMsgModal');
	new bootstrap.Modal(modalElement, {
		keyboard: false
	});
});

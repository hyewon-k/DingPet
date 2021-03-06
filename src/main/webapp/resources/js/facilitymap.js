var latlng = null;
var lat;
var lit;
var marker = new kakao.maps.Marker();
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 	마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({
	zIndex : 1
}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
	markers = [], // 마커를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new kakao.maps.LatLng(37.566821, 126.9786561), // 지도의 중심좌표
	level : 5
// 지도의 확대 레벨
	};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);
var myX, myY;
// 내 현 위치 찾기
function findLocation() {
navigator.geolocation.getCurrentPosition(function(pos) {
	
    lat = pos.coords.latitude;
    lit = pos.coords.longitude;
    $('#latitude').html(pos.coords.latitude);     // 위도 입력
    $('#longitude').html(pos.coords.longitude); // 경도 입력 
    latlng =  new kakao.maps.LatLng(lat,lit);
    map.panTo(latlng);
    marker.setPosition(latlng); 
    marker.setMap(map); 
    return map, lat, lit;
	})
}// find End
function findLocation2() {
		var center = map.getCenter(); 
		myY = center.getLat();
	    myX = center.getLng();
	    return myY, myX;
}
findLocation();
document.getElementById("mylocation").addEventListener("click", findLocation);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map);

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
	if (target.addEventListener) {
		target.addEventListener(type, callback);
	} else {
		target.attachEvent('on' + type, callback);
	}
}
// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
	if (!currCategory) {
		return;
	} // 커스텀 오버레이를 숨깁니다
	placeOverlay.setMap(null);
	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();
	
	findLocation2();
	
	if (currCategory == "CA7"){
		
		$.ajax({
			url: '/facilitymap/p001/cafeMap',
			data: {myX:myX,myY:myY,useMapBounds : true},
			type: 'GET',
			datatype:'JSON',
			success: function(data){
				if(data == null){
					alert("현재위치를 확인해주세요.");
					return;					
				} else {		
					status = "OK";
					order = 0;
					pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					};
					placesSearchCB(data, status, pagination);
					useMapBounds : true;
					
				}
				
			}
		}); // end of ajax	
	} else if (currCategory == "RE7"){
		
		$.ajax({
			url: '/facilitymap/p001/restaurantMap',
			data: {myX:myX,myY:myY,useMapBounds : true},
			type: 'GET',
			datatype:'JSON',
			success: function(data){
				if(data == null){
					alert("현재위치를 확인해주세요.");
					return;					
				} else {		
					status = "OK";
					order = 0;
					pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					};
					placesSearchCB(data, status, pagination);
					useMapBounds : true;
					
				}
			}
		}); // end of ajax	
	} else if (currCategory == "HT7"){
		
		$.ajax({
			url: '/facilitymap/p001/hotelMap',
			data: {myX:myX,myY:myY,useMapBounds : true},
			type: 'GET',
			datatype:'JSON',
			success: function(data){
				if(data == null){
					alert("현재위치를 확인해주세요.");
					return;					
				} else {		
					status = "OK";
					order = 0;
					pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					};
					placesSearchCB(data, status, pagination);
					useMapBounds : true;
					
				}
			}
		}); // end of ajax	
	} else if (currCategory == "HP2"){
			$.ajax({
				url: '/facilitymap/p001/mediMap2',
				data: {myX:myX,myY:myY,useMapBounds : true},
				type: 'GET',
				datatype:'JSON',
				success: function(data){
					if(data == null){
						alert("현재위치를 확인해주세요.");
						return;					
					} else {		
						status = "OK";
						order = 0;
						pagination = { 
						totalCount: 45,
						hasNextPage: true,
						hasPrevPage: false,
						first: 1,
						current: 1,
						last: 3,
						perPage: 15
						};
						placesSearchCB(data, status, pagination);
						useMapBounds : true;
					}
					
				}
			}); // end of ajax	
		} else if (currCategory == "HP9" ){
		$.ajax({
			url: '/facilitymap/p001/medicenterMap',
			data: {myX:myX,myY:myY,useMapBounds : true},
			type: 'GET',
			datatype:'JSON',
			success: function(list){
				if(list == null){
					alert("현재위치를 확인해주세요.");
					return;					
				}else {		
					status = "OK";
					order = 0;
					pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					}
					placesSearchCB(list, status, pagination);
					useMapBounds : true
				}
				
			}
		}); // end of ajax
	} else{
	ps.categorySearch(currCategory, placesSearchCB, {
		useMapBounds : true
	});
	}
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		displayPlaces(data);		
	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
	} else if (status === kakao.maps.services.Status.ERROR) {
		// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	}
}

//$("#HP9").on("click", function(e){


// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

	// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	var order = document.getElementById(currCategory).getAttribute('data-order');

	for (var i = 0; i < places.length; i++) {

		// 마커를 생성하고 지도에 표시합니다
		var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

		// 마커와 검색결과 항목을 클릭 했을 때
		// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		(function(marker, place) {
			kakao.maps.event.addListener(marker, 'click', function() {
				displayPlaceInfo(place);
			});
		})(marker, places[i]);
	}
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
	var imageSrc = 'https://www.dingpet.shop/imgs/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
	imgOptions = {
		spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		offset : new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
			{
				position : position, // 마커의 위치
				image : markerImage
			});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo(place) {
	var content = '<div class="placeinfo">' + '   <a class="title" href="'
			+ place.place_url + '" target="_blank" title="' + place.place_name
			+ '">' + place.place_name + '</a>';

	if (place.road_address_name) {
		content += '    <span title="' + place.road_address_name + '">'
				+ place.road_address_name + '</span>'
				+ '  <span class="jibun" title="' + place.address_name
				+ '">(지번 : ' + place.address_name + ')</span>';
	} else {
		content += '    <span title="' + place.address_name + '">'
				+ place.address_name + '</span>';
	}

	content += '    <span class="tel">' + place.phone + '</span>' + '</div>'
			+ '<div class="after"></div>';

	contentNode.innerHTML = content;
	placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	placeOverlay.setMap(map);
}

// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
	var category = document.getElementById('category'), children = category.children;

	for (var i = 0; i < children.length; i++) {
		children[i].onclick = onClickCategory;
	}
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
	var id = this.id, className = this.className;

	placeOverlay.setMap(null);

	if (className === 'on') {
		currCategory = '';
		changeCategoryClass();
		removeMarker();
	} else {
		currCategory = id;
		changeCategoryClass(this);
		searchPlaces();
	}
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
	var category = document.getElementById('category'), children = category.children, i;

	for (i = 0; i < children.length; i++) {
		children[i].className = '';
	}

	if (el) {
		el.className = 'on';
	}
}
// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});


function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
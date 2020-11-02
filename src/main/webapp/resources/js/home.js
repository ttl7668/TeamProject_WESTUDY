$('document').ready(function () {
	//배너 문구
	let bannerArr = [
		{
			/*TopThreeProductList*/
			imgSrc: 'img/banner1.jpg',
			/*imgSrc: '${pageContext.request.contextPath}' + '/Display/ProductThumbnail?pno=' + '${TopThreeProductListPno0}',*/
			bannerTitle: '제목...1',
			bannerContent: '내용...1',
		},
		{
			imgSrc: 'img/banner2.jpg',
			/*imgSrc: 'img/banner' + ${TopThreeProductListPno0} +'.jpg',*/
			bannerTitle: '제목..2',
			bannerContent: '내용..2',
		},
		{
			imgSrc: 'img/banner3.jpg',
			/*imgSrc: 'img/banner' + ${TopThreeProductListPno2} + '.jpg',*/
			bannerTitle: '제목...3',
			bannerContent: '내용...3',
		}
	];

	let bannerCounter = 0;
	const bannerWrapper = $('.banner-img');
	setInterval(function() {
		let i = bannerCounter++ % bannerArr.length;
		const item = bannerArr[i];
		if (!item.img) {
			const bannerImg = $('<img>');
			bannerImg.attr('src', item.imgSrc);
			item.img = bannerImg;
			const testImg = new Image();
			testImg.src = item.imgSrc;
			testImg.onload = function(e) {
				

			};
		}
		
		bannerWrapper.html(item.img);
		// $(".banner-background").css("background-color", getAverageRGB(bannerArr[bannerCounter]))
	}, 2000);

	var swiper = new Swiper('.swiper-container', {
		spaceBetween: 0, //마진값
		slidesPerView: 4,
		loop: false,
		rebuildOnUpdate: true,
		direction: getDirection(),
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		on: {
			resize: function () {
				swiper.changeDirection(getDirection());
			},
		},
	});

	function getDirection() {
		var windowWidth = window.innerWidth;
		var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

		return direction;
	}
});

function getAverageRGB(imgEl) {
	var blockSize = 5, // only visit every 5 pixels
		defaultRGB = { r: 0, g: 0, b: 0 }, // for non-supporting envs
		canvas = document.createElement('canvas'),
		context = canvas.getContext && canvas.getContext('2d'),
		data,
		width,
		height,
		i = -4,
		length,
		rgb = { r: 0, g: 0, b: 0 },
		count = 0;

	if (!context) {
		return defaultRGB;
	}

	height = canvas.height = imgEl.naturalHeight || imgEl.offsetHeight || imgEl.height;
	width = canvas.width = imgEl.naturalWidth || imgEl.offsetWidth || imgEl.width;

	context.drawImage(imgEl, 0, 0);

	try {
		data = context.getImageData(0, 0, width, height);
	} catch (e) {
		/* security error, img on diff domain */
		return defaultRGB;
	}

	length = data.data.length;

	while ((i += blockSize * 4) < length) {
		++count;
		rgb.r += data.data[i];
		rgb.g += data.data[i + 1];
		rgb.b += data.data[i + 2];
	}

	// ~~ used to floor values
	rgb.r = ~~(rgb.r / count);
	rgb.g = ~~(rgb.g / count);
	rgb.b = ~~(rgb.b / count);

	return rgb;
}

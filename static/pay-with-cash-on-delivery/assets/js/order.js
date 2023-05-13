var returnUrl = document.querySelector('#personalDetails').dataset.returnUrl;
var currency = document.querySelector('#personalDetails').dataset.currency;

function confirmGuestOrder(event) {
	event.preventDefault();
	var valid = formValidate();
	if (valid) {
		var itemsArray = [];
		var shippingPrice = $('.transfer').text();
		shippingPrice = shippingPrice.replace('$', '');
		var totalAmt = $('#totalOrderSummary').val();
		totalAmt = totalAmt.replace('$', '');
		$('#itemList li').each(function (index) {
			var imagePath = $(this).find('.order-list-img img').attr('src');
			var title = $(this).find('.order-list-details h4').html();
			var quantity = $(this).find('input[name=qty]').val();
			var itemTotalPrice = $(this).find('.order-list-price').text();
			itemTotalPrice = (itemTotalPrice.match(/[0-9.]+/g)) * 1;
			var itemPrice = itemTotalPrice / quantity;
			var arr = title.split('<br>');
			var productName = arr[0];
			itemsArray.push({
				'name': productName,
				'unit_price': itemPrice,
				'quantity': quantity
			});
		});
		$('#submitOrder').html('Processing...').css('text-align', 'left');
		$('.spinner-icon').show();
		$.ajax({
			contentType: 'application/json',
			url: '/queries/order',
			type: 'POST',
			data: JSON.stringify({
				items: [itemsArray],
				totalAmount: totalAmt,
				shippingTotal: shippingPrice,
				currency: currency
			}),
			success: async function (data) {
				if (data != 'error') {
					callWarningPopup('#modalSuccess');
					await new Promise(r => setTimeout(r, 2000));
					window.location = '/queries/order';
				} else {

					$('#submitOrder').html('Submit');
					$('.spinner-icon').hide();
				}

			}

		});
	}

}

function formValidate() {
	var terms = $('#cbxCashPayment').parsley();	

	if (!terms.isValid()) {
		return false;
	}
	return true;

}

function callWarningPopup(popupId) {
	$.magnificPopup.open({
		items: {
			src: popupId
		},
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		closeOnBgClick: false,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		closeMarkup: '<button title="%title%" type="button" class="mfp-close"></button>',
		mainClass: 'my-mfp-zoom-in'
	});
}
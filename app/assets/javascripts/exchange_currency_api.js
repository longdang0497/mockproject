// set endpoint and your access key

$(document).on('turbolinks:load', function() {
    // const ACCESS_KEY = 'b9b2af1ed1d7f0141724746d4f9bce37';
    const SYMBOLS = 'USD,KRW,TWD,CNY,THB,GBP,HKD,AUD,JPY';
    CurencyAPI();

});



function CurencyAPI(BASE = 'JPY') {
    let res = '';
    $.ajax({
        url: 'https://api.exchangerate-api.com/v4/latest/' + BASE,
        dataType: 'json',
        success: function (json) {
            // exchange rata data is stored in json.rates
            $('.top_money_main .top_money_rate .top_money_date, .top_money_left.sp .top_money_rate.sp .top_money_date.sp').html(json.date);
            $('.top_money_main .top_money_rate .top_money_change_rate, .top_money_left.sp .top_money_rate.sp .top_money_change_rate.sp').html(`1${json.base}  ≒  ${json.rates["EUR"]}EUR`);

            //Click function on button exchange-main
            $('.top_money_change_btn#calculate_main').click(function () {


                let moneyorigin = $('#MoneyOrigin').html();
                let moneyexchange = $('#MoneyChange').html();

                if (moneyorigin == 'JPY') {
                    //change content exchangecurrency
                    $('.top_money_main .top_money_rate .top_money_change_rate').html(`1${json.base}  ≒  ${json.rates[moneyexchange]}${moneyexchange}`);
                    let amount_origin = $('#MoneyOrigin').parent().find('input.top_money_input').val();
                    let output_moneyexchange = $('#MoneyChange').parent().find('input.top_money_input');
                    output_moneyexchange.val(0);

                    if (amount_origin == '' || amount_origin < 0) {
                        $('#MoneyOrigin').parent().find('input.top_money_input').val(0);
                    } else {
                        let out = amount_origin * json.rates[moneyexchange];
                        output_moneyexchange.val(currency(out));

                    }
                }
                else {
                    //change content exchangecurrency
                    $('.top_money_main .top_money_rate .top_money_change_rate').html(`1${moneyorigin}  ≒  ${1 / json.rates[moneyorigin]}${moneyexchange}`);
                    let amount_origin = $('#MoneyOrigin').parent().find('input.top_money_input').val();
                    let output_moneyexchange = $('#MoneyChange').parent().find('input.top_money_input');
                    output_moneyexchange.val(0);
                    if (amount_origin == '' || amount_origin < 0) {
                        $('#MoneyOrigin').parent().find('input.top_money_input').val(0);
                    } else {

                        let out = amount_origin * (1 / json.rates[moneyorigin]);
                        output_moneyexchange.val(currency(out));
                    }
                }

            });

            //Click function on button exchange-sidebar
            $('.top_money_change_btn.sp').click(function(){
                let moneyorigin = $('#SideMoneyOrigin').html();
                let moneyexchange = $('#SideMoneyChange').html();

                if (moneyorigin == 'JPY') {
                    //change content exchangecurrency
                    $('.top_money_left.sp .top_money_rate.sp .top_money_change_rate.sp').html(`1${json.base}  ≒  ${json.rates[moneyexchange]}${moneyexchange}`);
                    let amount_origin = $('#SideMoneyOrigin').parent().find('input.top_money_input.sp').val();
                    let output_moneyexchange = $('#SideMoneyChange').parent().find('input.top_money_input.sp');
                    output_moneyexchange.val(0);

                    if (amount_origin == '' || amount_origin < 0 ) {
                        $('#SideMoneyOrigin').parent().find('input.top_money_input.sp').val(0);
                    } else {
                        let out = amount_origin * json.rates[moneyexchange];
                        output_moneyexchange.val(currency(out));

                    }
                }
                else {
                    //change content exchangecurrency
                    $('.top_money_left.sp .top_money_rate.sp .top_money_change_rate.sp').html(`1${moneyorigin}  ≒  ${1 / json.rates[moneyorigin]}${moneyexchange}`);
                    let amount_origin = $('#SideMoneyOrigin').parent().find('input.top_money_input.sp').val();
                    let output_moneyexchange = $('#SideMoneyChange').parent().find('input.top_money_input.sp');
                    output_moneyexchange.val(0);
                    if (amount_origin == '' || amount_origin < 0) {
                        let amount_origin = $('#SideMoneyOrigin').parent().find('input.top_money_input.sp').val();
                        $('#SideMoneyOrigin').parent().find('input.top_money_input.sp').val(0);
                    } else {

                        let out = amount_origin * (1 / json.rates[moneyorigin]);
                        output_moneyexchange.val(currency(out));
                    }
                }
            });
        }
    });

}


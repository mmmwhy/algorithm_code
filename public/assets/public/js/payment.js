
$(document).ready(function() {
    $('#alipay-submit').on('click', function() {
        const amountInput = $('#payment-amount');
        var totalAmount = parseFloat(amountInput.val()) * 100;
        var stripe = Stripe($('#stripe').val());
        var user = $('#user').val();
        var alipayRedirect = $('#alipayRedirect').val();
        var stripeSource = stripe.createSource({
            type: 'alipay',
            amount: totalAmount,
            currency: 'usd',
            owner: {
                name: user,
            },
            redirect: {
                return_url: alipayRedirect
            },

        }).then(function(result) {
            if (result && result.source && result.source.redirect && result.source.redirect['url']) {
                //console.log(result.source.id);
                //console.log(result.source.amount/100);

                $.ajax({
                    type:"POST",
                    url:"/user/code/stripe_pay",
                    dataType:"json",
                    data:{
                        userid: result.source.owner.name,
                        total: result.source.amount/100,
                        tradeno: result.source.id
                    },
                    success:function(data){
                        if(data.ret == 1){
                            $("#result").modal();
                            $("#msg").html(data.msg);
                            window.setTimeout(location.href = result.source.redirect['url'], 2000);
                        }else{
                            $("#result").modal();
                            $("#msg").html(data.msg);
                        }
                    },
                    error:function(){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                });
            } else {
                console.log(result);
                $("#result").modal();
                $("#msg").html(result.error.message);
            }
        });
    });

});

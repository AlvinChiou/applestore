/**
 * Created by AlvinChiu on 2016/3/31.
 */
$("img.thumbnail").lazyload({
    effect: "fadeIn"
});

$("input[name='amount']").TouchSpin({
    min: 1,
    max: 10,
    postfix: '組'
});

$('[data-countdown]').each(function () {
    var $this = $(this), finalDate = $(this).data('countdown');
    $this.countdown(finalDate, function (event) {
        $this.html(event.strftime('優惠截止 %D 天 %-H 時 %M 分 %S 秒'));
    });
});


/**
 * Created by AlvinChiu on 2016/3/31.
 */
$("img.thumbnail").lazyload({
    effect : "fadeIn"
});

$("input[name='amount']").TouchSpin({
    min: 1,
    max: 10,
    postfix: '組'
});
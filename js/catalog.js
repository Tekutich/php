$(function() {

    $('.btn.btn-primary').click(function(){
        window.location = "productinfo.php?drug="+$(this).val()+"";
    });

})
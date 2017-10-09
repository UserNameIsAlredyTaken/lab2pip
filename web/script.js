$(document).ready(function () {
    $('#back').click(function () {
        window.location= 'http://localhost:8080/lab2pip_war_exploded/controller';
    })
    $('#find').click(function (eventObject) {
        var x = eventObject.pageX;
        var y = eventObject.pageY;
        var r=parseInt($('#field_r').val());
        var realX= Math.round(((- 1062 - 145 + eventObject.pageX)/145*2.68*r/2) * 100000)/ 100000;
        var realY= Math.round((( 150 - eventObject.pageY)/145*2.71*r/2) * 100000)/ 100000;
        var order = {
            x: realX,
            y: realY,
            r: r
        };
        var check = false;
        if(realX<=0&&realY<=0&&realY>=-2*realX-r){
            check = true;
        }
        if(realX<=0&&realY>=0&&(realY*realY+realX*realX<=r/2*r/2)&&(realX>=-r/2)&&(realY<=r/2)){
            check = true;
        }
        if(realX>=0&&realY<=0&&realX<=r&&realY>=-r){
            check = true;
        }
        if(check)
        $("body").append(
            $('<div id="point"></div>')
                .css('position', 'absolute')
                .css('top', (y-4) + 'px')
                .css('left', (x-4) + 'px')
                .css('width', '8px')
                .css('height', '8px')
                .css('background-color', 'green')
                .css('border-radius', '3px')
        );
        else
            $("body").append(
                $('<div id="point"></div>')
                    .css('position', 'absolute')
                    .css('top', (y-4) + 'px')
                    .css('left', (x-4) + 'px')
                    .css('width', '8px')
                    .css('height', '8px')
                    .css('background-color', 'yellow')
                    .css('border-radius', '3px')
            );
        var url = 'http://localhost:8080/lab2pip_war_exploded/controller?x=' + realX + '&y=' + realY + '&r=' + order.r + '&written=yes';
        window.location= url;
    });
    $(window).resize(function() {
        if ($("#point").length) {
            $("#point").remove();
        }
    });
});
function proverka() {
    var isYtrue = false;
    var y = document.getElementsByName('y');
    var x = document.getElementById('field_x').value;
    for (var i = 0; i < y.length; i++) {
        if (y[i].checked) {
            isYtrue=true;
        }
    }
    if(x===""){
        alert("You have not entered a value of x!");
        return false;
    }
    if(x>3 || x <-5){
        alert("Incorrect value of x!");
        return false;
    }
    if(!isYtrue){
        alert("You did not select a value of y!");
        return false;
    }
    return true;
}
function onloadcheck(realX,realY,r) {
for(var i = 0;i<realX.length;i++) {
    var check = false;
    if (realX[i] <= 0 && realY[i] <= 0 && realY[i] >= -2 * realX[i] - r[i]) {
        check = true;
    }
    if (realX[i] <= 0 && realY[i] >= 0 && (realY[i] * realY[i] + realX[i] * realX[i] <= r[i] / 2 * r[i] / 2) && (realX[i] >= -r[i] / 2) && (realY[i] <= r[i] / 2)) {
        check = true;
    }
    if (realX[i] >= 0 && realY[i] <= 0 && realX[i] <= r[i] && realY[i] >= -r[i]) {
        check = true;
    }
    var y = -(realY[i]*2/r/2.71*145-150) +12;
    var x = (realX[i]*2/r/2.68*145+145+1062);
    if (check)
        $("body").append(
            $('<div></div>')
                .css('position', 'absolute')
                .css('top', (y - 4) + 'px')
                .css('left', (x - 4) + 'px')
                .css('width', '8px')
                .css('height', '8px')
                .css('background-color', 'green')
                .css('border-radius', '3px')
        );
    else
        $("body").append(
            $('<div></div>')
                .css('position', 'absolute')
                .css('top', (y - 4) + 'px')
                .css('left', (x - 4) + 'px')
                .css('width', '8px')
                .css('height', '8px')
                .css('background-color', 'yellow')
                .css('border-radius', '3px')
        );
}
}
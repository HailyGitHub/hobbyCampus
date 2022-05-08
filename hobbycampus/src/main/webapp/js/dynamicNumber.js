//$(window).onload(function(){
    //var executed = 0;

    $(window).scroll(function(){
        var threshold = $('#dynamic-box').offset().top - 700;
		
		//if(executed===0){
            if($(window).scrollTop() >= threshold) {
				
                var rate1 = $('#dynamic1').attr('data-rate');
                var rate2 = $('#dynamic2').attr('data-rate');
                var rate3 = $('#dynamic3').attr('data-rate');
                var rate4 = $('#dynamic4').attr('data-rate');
                
                $({percent: 0}).animate({percent: rate1},{
                    duration: 1500,
                    progress: function(){
                        var now = this.percent;
                        $('#dynamic1').text(Math.ceil(now));
                    }
                });
                $({percent: 0}).animate({percent: rate2},{
                    duration: 1500,
                    progress: function(){
                        var now = this.percent;
                        $('#dynamic2').text(Math.ceil(now));
                    }
                });
                $({percent: 0}).animate({percent: rate3},{
                    duration: 1500,
                    progress: function(){
                        var now = this.percent;
                        $('#dynamic3').text(Math.ceil(now));
                    }
                });
                $({percent: 0}).animate({percent: rate4},{
                    duration: 1500,
                    progress: function(){
                        var now = this.percent;
                        $('#dynamic4').text(Math.ceil(now));
                    }
                });
            }
            executed = 1;
         //}
    });
//});
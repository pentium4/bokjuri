if(typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, ''); 
	};
}

if(typeof String.prototype.ltrim !== 'function') {
	String.prototype.ltrim = function() {
	    return this.replace(/^\s+/,"");
	};
}

if(typeof String.prototype.rtrim !== 'function') {
	String.prototype.rtrim = function() {
	    return this.replace(/\s+$/,"");
	};
}

String.prototype.isEmpty = function() {
    return (this.length === 0 || !this.trim());
};

String.prototype.replaceAll = function(target, replacement) {
	return this.split(target).join(replacement);
};

var _popup = null;
if(_popup != null)	_popup.focus();
$(document).ready(function () {
	// ajax form file
	$.fn.serializeFiles = function() {
	    var obj = $(this);
	    /* ADD FILE TO PARAM AJAX */
	    var formData = new FormData();
	    $.each($(obj).find("input[type='file']"), function(i, tag) {
	        $.each($(tag)[0].files, function(i, file) {
	            formData.append(tag.name, file);
	        });
	    });
	    
	    var params = $(obj).serializeArray();
	    $.each(params, function (i, val) {
	        formData.append(val.name, val.value);
	    });
	    return formData;
	};	
	
	// Numeric only control handler
	jQuery.fn.numericOnly = function() {
		return this.each(function() {
			$(this).keydown(function(e) {
				var key = e.charCode || e.keyCode || 0;
				// allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
				return (
									key == 8 ||
									key == 9 ||
									key == 13 ||
									key == 46 ||
									key == 110 ||
									key == 190 ||
									(key >= 37 && key <= 40) ||
									(key >= 48 && key <= 57) ||
									(key >= 96 && key <= 105));
			});
			
			$(this).focusout(function() { $(this).val($(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1")); });
			$(this).focusin(function() { $(this).val($(this).val().replace(/\,/g, '')); });
			$(this).css("ime-mode", "disabled");
		});
	};
	
	// 영문만 입력
	$.fn.numericEngOnly = function() {
	//		$(this).css("ime-mode", "disabled");
	};
	
	jQuery.fn.tel = function() {
		var $this = $(this);
		$this.on("keyup", function(){
			var telregex = /(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
			var tel = $(this).val().replaceAll("-", "").replace(telregex,"$1-$2-$3");
			$(this).val(tel);
		}).numericOnly();
	};
	
	// 월콤보
	$.fn.monthCombo = function( options ) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 fixVal: '01'	// 고정값
	    	,searchable: false	// 검색콤보박스 true/false
	    	,top: true	// 상단명 출력여부 true/false
	    	,topLabel: "--전체--"	// 상단명
	    	,isMobile: false
	    }, options);
	    
	    var _this = $(this);
	    
	    var html = "";
	    if(settings.top){
	    	html += "<option value=''>"+ settings.topLabel +"</option>";	
	    }
	    
	    html += "<optgroup label='상반기'>";
	    html += "	<option value='07'>7월</option>";
	    html += "	<option value='08'>8월</option>";
	    html += "	<option value='09'>9월</option>";
	    html += "	<option value='10'>10월</option>";
	    html += "	<option value='11'>11월</option>";
	    html += "	<option value='12'>12월</option>";
	    html += "</optgroup>";
	    
	    html += "<optgroup label='하반기'>";
	    html += "	<option value='01'>1월</option>";
	    html += "	<option value='02'>2월</option>";
	    html += "	<option value='03'>3월</option>";
	    html += "	<option value='04'>4월</option>";
	    html += "	<option value='05'>5월</option>";
	    html += "	<option value='06'>6월</option>";
	    html += "</optgroup>";
	    
	    _this.append(html);
	    _this.val(settings.fixVal);
		if(settings.searchable){
			_this.addClass("chosen-select");
			initChosen();
	    }
		
		if(settings.isMobile){
			_this.selectmenu("refresh");
		}
	    
		/*
		//다음달로 값을 변경하는 이벤트  
		$(this).on("next", function( event ) {
			$(this).val(Date.today().set({ month: Number($(this).val())-1}).addMonths( 1).toString("MM"));
		});
		
		//이전달로 값을 변경하는 이벤트 
		$(this).on("prev", function( event ) {
			$(this).val(Date.today().set({ month: Number($(this).val())-1}).addMonths(-1).toString("MM"));
		});
		*/
	};	
	
	$.fn.sessionYearCombo = function( options ) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 fixVal: thisSessionYear()	// 고정값
	    	,searchable: false	// 검색콤보박스 true/false
	    	,top:true	// 상단명 출력여부 true/false
	    	,topLabel: "&nbsp;&nbsp;--전체--"	// 상단명
	    	,isMobile: false
	    }, options );
	    
	    $(this).on("change", function(){
	    	var sessionYear = $(this).val() == null ? settings.fixVal : $(this).val();
	        var startYear = sessionYear == "" ? Date.today().addYears(-10).toString("yyyy") : Date.parseExact(sessionYear, 'yyyy').addYears(-10).toString("yyyy");
	        var endYear = sessionYear == "" ? Date.today().addYears(11).toString("yyyy") : Date.parseExact(sessionYear, 'yyyy').addYears(11).toString("yyyy");
	    	
	        $(this).empty();	// select 내용 삭제
	        
	        if(settings.top){
	        	$(this).append("<option value=''>"+ settings.topLabel +"</option>");	
	        }
	        
	        for(var year = startYear; year < endYear; year++){
	        	$(this).append("<option value="+ year +">"+ eval(year+"-1") + " - " + year +"</option>");
	        	
	        	if(year == endYear-1){
	        		$(this).val(sessionYear);
					if(settings.searchable){
						_this.addClass("chosen-select");
						initChosen();
					}
					
					if(settings.isMobile){
						$(this).selectmenu("refresh");	
					}
	        	}
	        }
	    }).change();
	};
	
	$.fn.dialogPopup = function( options ) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 height: 500
	    	,width: 700
	    	,callback: null
	    }, options );
	    
		$(this).dialog({
			autoOpen: false,
			height: settings.height,
			width: settings.width,
			modal: true,
			resizable : false,
			close: function() {
			}
		});
		
		$(this).dialog( "open" );
		
	    if (typeof settings.callback == 'function') { // make sure the callback is a function
	    	settings.callback.call(this); // brings the scope to the callback
	    }
	};
	
	$(".dialogClose").on("click", function(){
		$(this).parents(".ui-dialog-content").dialog('close');
	});
	
	
	$.widget("ui.combobox", {
	    _create: function () {
	        var input,
	          that = this,
	          wasOpen = false,
	          select = this.element.hide(),
	          selected = select.children(":selected"),
	          defaultValue = selected.text() || "",
	          wrapper = this.wrapper = $("<span>")
	            .addClass("ui-combobox")
	            .insertAfter(select);
	
	        function removeIfInvalid(element) {
	            var value = $(element).val(),
	              matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(value) + "$", "i"),
	              valid = false;
	            select.children("option").each(function () {
	                if ($(this).text().match(matcher)) {
	                    this.selected = valid = true;
	                    return false;
	                }
	            });
	
	            if (!valid) {
	                // remove invalid value, as it didn't match anything
	                $(element).val(defaultValue);
	                select.val(defaultValue);
	                input.data("ui-autocomplete").term = "";
	            }
	        }
	
	        input = $("<input>")
	          .appendTo(wrapper)
	          .val(defaultValue)
	          .attr("title", "")
	//              .addClass("ui-state-default ui-combobox-input")
	          .width(select.width())
	          .autocomplete({
	              delay: 0,
	              minLength: 0,
	              autoFocus: true,
	              source: function (request, response) {
	                  var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
	                  response(select.children("option").map(function () {
	                      var text = $(this).text();
	                      if (this.value && (!request.term || matcher.test(text)))
	                          return {
	                              label: text.replace(
	                                new RegExp(
	                                  "(?![^&;]+;)(?!<[^<>]*)(" +
	                                  $.ui.autocomplete.escapeRegex(request.term) +
	                                  ")(?![^<>]*>)(?![^&;]+;)", "gi"
	                                ), "<strong>$1</strong>"),
	                              value: text,
	                              option: this
	                          };
	                  }));
	              },
	              select: function (event, ui) {
	                  ui.item.option.selected = true;
	                  that._trigger("selected", event, {
	                      item: ui.item.option
	                  });
	              },
	              change: function (event, ui) {
	                  if (!ui.item) {
	                      removeIfInvalid(this);
	                  }
	              }
	          });
	//              .addClass("ui-widget ui-widget-content ui-corner-left");
	
	        input.data("ui-autocomplete")._renderItem = function (ul, item) {
	            return $("<li>")
	              .append("<a>" + item.label + "</a>")
	              .appendTo(ul);
	        };
	
	        $("<a>")
	          .attr("tabIndex", -1)
	          .appendTo(wrapper)
	          .button({
	              icons: {
	                  primary: "ui-icon-triangle-1-s"
	              },
	              text: false
	          })
	          .removeClass("ui-corner-all")
	          .removeClass("ui-widget ui-state-default ui-button-icon-only")
	//              .addClass("ui-corner-right ui-combobox-toggle")
	          .mousedown(function () {
	              wasOpen = input.autocomplete("widget").is(":visible");
	          })
	          .click(function () {
	              input.focus();
	
	              // close if already visible
	              if (wasOpen) {
	                  return;
	              }
	
	              // pass empty string as value to search for, displaying all results
	              input.autocomplete("search", "");
	          });
	        
	          input.click(function(){
	        	 $(this).select(); 
	          });
	    },
	
	    _destroy: function () {
	        this.wrapper.remove();
	        this.element.show();
	    },
	    
	    select: function( event, ui ) {
	        ui.item.option.selected = true;
	        self._trigger( "selected", event, {
	            item: ui.item.option
	        });
	        select.trigger("change");
	    }
	
	});
	
	$.fn.organCode = function(options, callback) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 sessionYear: null	// 회기년도(회기년도를 입력하면 그회기에 존재하는 조직코드를 불러온다)
	    	,lvl: null	// 1:연합회, 2:복합지구, 3:지구, 4:클럽
	    	,lvlStart: null	// 1:연합회, 2:복합지구, 3:지구, 4:클럽 -- 범위 시작레벨
	    	,lvlEnd: null	// 1:연합회, 2:복합지구, 3:지구, 4:클럽 -- 범위 마지막레벨
	    	,upperOrganCode: null	// 상위조직코드
	    	,fixVal: null	// 고정값
	    	,top: false	// 상단명 출력여부 true/false
	    	,topLabel: "-- 전체 --"	// 상단명 
	    	,searchable: false	// 검색콤보박스 true/false
	    	,onlyName: false
	    	,shortenName: false
	    	,nameWithShortenCode: false
	    	,async: true
	    	,auth: true	// 권한 적용여부 true/false
	    	,isMobile: false
	    }, options );
	    
	    // id, lvl, value, topLabel
	    var _this = $(this);
	    var _chosen = $(this).next();
	    var _id = _this.prop("id");
	    
	    /* 로딩중 */
	    _this.css('visibility', 'hidden');
	    _chosen.css('visibility', 'hidden');
	    _this.before("<img class='" + _id + "_loading2' src='/images/lionsclubs/jssor/img/loading2.gif' />");
	    
		var params = [];
		params.push({name: "sessionYear", value: settings.sessionYear});
		params.push({name: "lvl", value: settings.lvl});
		params.push({name: "lvlStart", value: settings.lvlStart});
		params.push({name: "lvlEnd", value: settings.lvlEnd});
		params.push({name: "upperOrganCode", value: settings.upperOrganCode});
		params.push({name: "shortenName", value: settings.shortenName});
		params.push({name: "auth", value: settings.auth});
		
		$.ajax({
			type: "POST",
			async: settings.async,
			url:  '/common/organ/organTreeList.do',
			data: params,
			dataType: 'json',
			success: function(data) {
				if(data.result){
					var organCodeAppend = "";
					_this.empty();
					
					if(settings.top){
						organCodeAppend += "<option value=''>"+ settings.topLabel +"</option>";
					}
					var total = data.organTreeList.length;
					$.each(data.organTreeList, function(index, object){
						var organCode = (settings.nameWithShortenCode ? "": object.organCode.substring(0,3) + "-") + object.organCode.substring(3,6);
						organCodeAppend += "<option value="+ object.organCode +">"+ (settings.onlyName ? "" : organCode + " ") + object.koName +"</option>";
						
						if(index == total - 1){
							_this.css('visibility', 'visible');
							_chosen.css('visibility', 'visible');
							/* 로딩제거 */
							$("." + _id + "_loading2").remove();
							
							_this.append(organCodeAppend);
	
							if(settings.fixVal != null) {
								_this.val(settings.fixVal);	
							}
							
							if(settings.searchable) {
								_this.addClass("chosen-select");
								initChosen();
							}
							
							if(settings.isMobile) {
								_this.selectmenu("refresh");	
							}
							
							_this.on("change", function(){
								$.saveOrganCode({
									 lvl: settings.lvl
									,organCode: $(this).val()
								});
							});
						}
					});
					
					if(total == 0) {
						_this.css('visibility', 'visible');
						_chosen.css('visibility', 'visible');
						/* 로딩제거 */
						$("." + _id + "_loading2").remove();
						
						_this.on("change", function(){
							$.saveOrganCode({
								 lvl: settings.lvl
								,organCode: $(this).val()
							});
						});						
					}
					
				    if (typeof callback == 'function') { // make sure the callback is a function
				        callback.call(this); // brings the scope to the callback
				    }
				}
			},
			error:function(request,status,error){
			}		
		});
	};    
	
	/**
	 * 검색유지 회기년도를 저장한다.
	 */	
	$.saveSessionYear = function(options) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	sessionYear: null	// 검색유지 조직코드
	    }, options );
	  
	    if(settings.sessionYear !="" && settings.sessionYear != null){
	    	var params = [];
	    	params.push({name:"sessionYear", value:settings.sessionYear});
			
			$.ajax({
				type: "POST",
				async: false,		
				url:  '/m/main/setSessionYear.do',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result) {
					}
				},
				error:function(request,status,error){
//					alert("잘못된 동작 입니다. 다시 입력 해주세요.");
				}		
			});
	    }
	};
	
	/**
	 * 검색유지 조직코드를 저장한다.
	 */	
	$.saveOrganCode = function(options) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 lvl: null	// 1:연합회, 2:복합지구, 3:지구, 4:클럽
	    	,organCode: null	// 검색유지 조직코드
	    	,async: true
	    }, options );
	  
	    if(settings.organCode !="" && settings.organCode != null){
	    	var params = [];
	    	params.push({name:"searchOrganCode", value:settings.organCode});
	    	params.push({name:"lvl", value:settings.lvl});
	    	
	    	$.ajax({
	    		type: "POST",
	    		async: settings.async,			
	    		url:  '/include/clubprofile/saveSearchOrganCode.do',
	    		data: params,
	    		dataType: 'json',
	    		success: function(data) {
	    			if(data.result){
	    				
	    			}
	    		},
	    		error:function(request,status,error){
//	    			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	    			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}		
	    	});
	    }
	};
	
	/**
	 * 검색유지 회원번호를 저장한다.
	 */
	$.saveMemberNo = function(options) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	memberNo: null	// 검색유지 회원번호
	    }, options );
	  
		var params = [];
		params.push({name:"memberNo", value:settings.memberNo});
		
		$.ajax({
			type: "POST",
			async: false,			
			url:  '/common/member/saveMemberNo.do',
			data: params,
			dataType: 'json',
			success: function(data) {
				if(data.result){
					
				}
			},
			error:function(request,status,error){
//				alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}		
		});
	};	
	
	$.fn.option1Code = function(options, callback) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 groupCode: null	// 그룹코드
	    	,code: null	// 코드
	    	,fixVal: null	// 고정값
	    	,topLabel: null	// 상단명(상단명을 정하지 않으면 나타나지 않음)
	    	,searchable: false	// 검색콤보박스 true/false
	    	,isMobile: false
	    }, options );
	    
	    var _this = $(this);
	    var _id = _this.prop("id");
	    /* 로딩중 */
	    _this.css('visibility', 'hidden');
	    _this.before("<img class='" + _id + "_loading2' src='/images/lionsclubs/jssor/img/loading2.gif' />");
	    
	    
		var params = [];
		
		params.push({name: "groupCode", value: settings.groupCode});
		params.push({name: "code", value: settings.code});
	
		var _this = $(this);
		$.ajax({
			type: "POST",
			async: true,
			url:  '/commonCode/codeOption1List.do',
			data: params,
			dataType: 'json',
			success: function(data) {
	//				alert("fixVal : "+settings.fixVal);
				if(data.result){
					_this.empty();
					
					if(settings.topLabel != null){
						_this.append("<option value=''>"+ settings.topLabel +"</option>");
					}
					var total = data.resultList.length;
					$.each(data.resultList, function(index, object){
						_this.append("<option value='"+ object.code +"' data-code1='" + object.code1 + "' data-code2='" + object.code2 + "' data-code3='" + object.code3 + "'>"+ object.codeName +"</option>");
						if(index == total - 1){
							if(settings.fixVal != null){
								_this.val(settings.fixVal);	
							}
							
							if(settings.searchable){
								_this.addClass("chosen-select");
								initChosen();
							}
							
							_this.css('visibility', 'visible');
							/* 로딩제거 */
							$("." + _id + "_loading2").remove();
							
							if(settings.isMobile){
								_this.selectmenu("refresh");	
							}
						}
					});
					
					if(total == 0){
						_this.css('visibility', 'visible');
						/* 로딩제거 */
						$("." + _id + "_loading2").remove();
						
						if(settings.isMobile){
							_this.selectmenu("refresh");	
						}						
					}
					
				    if (typeof callback == 'function') { // make sure the callback is a function
				        callback.call(this); // brings the scope to the callback
				    }
				}
			},
			error:function(request,status,error){
				alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}		
		});	
	};
	
	// 옵션1코드를 읽어서 옵션2코드를 불러온다.
	$.fn.option2Code = function(options) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 groupCode: null	// 그룹코드
	    	,code: null	// 코드
	    	,code1: null	// 클럽행사의 코드1 조건 (예: A or A,B or A,B,C or A,C)
	    					// A - 조직행사, 공적
	    					// B - 조직행사
	    					// C - 공적
	    	,fixVal: null	// 고정값
	    	,topLabel: null	// 상단명(상단명을 정하지 않으면 나타나지 않음)
	    	,searchable: false	// 검색콤보박스 true/false
	    }, options );
	    
		var params = [];
		
		params.push({name: "groupCode", value: settings.groupCode});
		params.push({name: "code", value: settings.code});
		params.push({name: "code1", value: settings.code1});
	
		var _this = $(this);
		$.ajax({
			type: "POST",
			async: false,
			url:  '/commonCode/codeOption2List.do',
			data: params,
			dataType: 'json',
			success: function(data) {
				if(data.result){
					_this.empty();
					
					if(settings.topLabel != null){
						_this.append("<option value=''>"+ settings.topLabel +"</option>");
					}
					var total = data.resultList.length;
					$.each(data.resultList, function(index, object){
						_this.append("<option value='"+ object.code +"' data-code1='"+ object.code1 +"' data-code2='"+ object.code2 +"' data-code3='"+ object.code3 +"'>"+ object.codeName +"</option>");
						if(index == total - 1){
							if(settings.fixVal != null){
								_this.val(settings.fixVal);	
							}
							if(settings.searchable){
								_this.addClass("chosen-select");
								initChosen();
							}
						}
					});
					
					if(total == 0){
						if(settings.searchable){
							_this.addClass("chosen-select");
							initChosen();
						}
					}
				}
			},
			error:function(request,status,error){
				alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}		
		});	
	};	
	
	jQuery.download = function(url, data, method) {
		//url and data options required
		if (url || data) {
			//split params into form inputs
			var inputs = '';
			if(data != null){
				//data can be string of parameters or array/object
				data = typeof data == 'string' ? data : jQuery.param(data);
				jQuery.each(data.split('&'), function() { 
					var pair = this.split('=');
					inputs += '<input type="hidden" name="' + pair[0] + '" value="' + pair[1] + '" />'; 
				});
			}
			
			//send request
			jQuery('<form action="' + url + '" method="' + (method || 'post') +'">' + inputs + '</form>').appendTo('body').submit().remove();
		};
	};
	
	/* 
	 * 
	 * 같은 값이 있는 열을 병합함
	 * 
	 * 사용법 : $('#테이블 ID').rowspan (0);
	 * 
	 */
	$.fn.rowspan = function(colIdx, options, extd) {
		var settings = jQuery.extend({
		    tagelements: "td"
		 }, options);
		
		return this.each(function(){
			var that;
			$('tr', this).each(function(row) {
				$(settings.tagelements + ':eq('+colIdx+'):visible', this).each(function(col) {  
					if ($(this).html() == $(that).html()) {            
						rowspan = $(that).attr("rowSpan");            
						if (rowspan == undefined) {                     
							$(that).attr("rowSpan",1);
							
							if (extd) {
								$(that).next().attr("rowSpan",1);
							}
							
							rowspan = $(that).attr("rowSpan");            
						}            
						rowspan = Number(rowspan)+1;            
						$(that).attr("rowSpan",rowspan); // do your action for the colspan cell here            
						$(this).hide(); // .remove(); // do your action for the old cell here
						
						if (extd) {
							$(that).next().attr("rowSpan",rowspan);
							$(this).next().hide();
						}
						
					} else {            
						that = this;          
					}          
					that = (that == null) ? this : that; // set the that if not already set      
				});     
			});
		});  
	}; 
	
	/* 
	 * 
	 * 같은 값이 있는 행을 병합함
	 * 
	 * 사용법 : $('#테이블 ID').colspan (0);
	 * 
	 */
	$.fn.colspan = function(rowIdx, options) {
		var settings = jQuery.extend({
		    tagelements: "td"
		 }, options);		
		
	    return this.each(function(){
	        var that;
	        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
	            $(this).find(settings.tagelements).filter(':visible').each(function(col) {
	                if ($(this).html() == $(that).html()) {
	                    colspan = $(that).attr("colSpan") || 1;
	                    colspan = Number(colspan)+1;
	                     
	                    $(that).attr("colSpan",colspan);
	                    $(this).hide(); // .remove();
	                } else {
	                    that = this;
	                }
	                 
	                // set the that if not already set
	                that = (that == null) ? this : that;
	                 
	            });
	        });
	    });
	};
	
	/**
	 * jfile에 있는 이미지 view
	 */
	jQuery.viewThumbnailPopup = function(options) {
		var settings = jQuery.extend({
		     fileId: null
		    ,height: 768
		    ,width: 1024
		}, options);
		
	    var src = '/jfile/viewThumbnailPopup.do?fileId=' + settings.fileId + '&height=' + settings.height + '&width=' + settings.width;
	    $.modal('<iframe src="' + src + '" height="' + settings.height + '" width="' + settings.width + '" style="border:0;padding:0;">', {
	         closeHTML: ""
	        ,overlayCss: { "background-color": "#000", "cursor": "wait" }
	        ,containerCss: {
	             height : (settings.height + 10) + 'px'
	            ,width : (settings.width + 10) + 'px'
	            ,overflow : 'hidden'
	            ,backgroundColor: "#ffffff"
	            ,borderColor: "#ffffff"
	            ,padding: 0
	        }
	        ,overlayClose: true
	    });	
	};
	
	$.fn.printPreviewPopup = function( options ) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	 content: $(this).val()
	    	,height: 500
	    	,width: 700
	    	,callback: null
	    }, options );
	    
	    alert(settings.content);
	    openPopup("/common/printPreview/printPreviewPopup.do?content=" + settings.content, '700', '400', "printPreviewPopup");
	    
	    if (typeof settings.callback == 'function') { // make sure the callback is a function
	    	settings.callback.call(this); // brings the scope to the callback
	    }
	};	
		
	/* title이 있는 모든곳에 tooltip 적용 */
	$("*[title]").each(function(){
		if(!$(this).prop("title").isEmpty()){
			$(this).tooltipster({
				contentAsHTML: true
			});
		}
	});
	
	/* dialog팝업 title명 */
	$(".dialog").prop("title", "화면닫기");
	
	/* 버튼권한 처리 */
	$('.authorization').each(processAuthorization);
	
	// 스크롤바 유무 check
	$.fn.hasVerticalScrollbar = function() {
	    // This will return true, when the div has vertical scrollbar
	    return this.get(0).scrollHeight > this.height();
	};
	
	$.fn.hasHorizontalScrollbar = function() {
	    // This will return true, when the div has horizontal scrollbar
	    return this.get(0).scrollWidth > this.width();
	};
	
	/**
	 * 검색타입의 select box일때 overflow:hidden이면 td안으로 숨는다.
	 * 이를 해결하기 위해 select box일때 td의 overflow를 visible로 한다.
	 */
	$("select").each(function(){
		var td = $(this).closest("td");
		td.css("overflow", "visible");
	});
	
	$("img").lazyload();
	
	// selectbox 검색
	initChosen();
	
	/**
	 * html: 테이블에 추가할 라인html
	 * number: 첫 필드에 No.를 출력한다.(default: true)
	 * deleteButton: 마지막 필드에 삭제버튼을 출력한다.(default: true)
	 * hover: 라인 hover(default: true) 
	 * header: 헤더존재여부. 헤더가 존재하면 헤더를 제외하고 숫자를 출력한다. 헤더가 존재하지 않으면 그대로 출력(default: true)
	 * addposition : 추가할 위치. 가장상단에 추가하고 싶으면 prepend, 가장아래는 append를 입력(default: append)
	 */
	$.fn.addrow = function(options, callback) {
		var settings = jQuery.extend({
			html: "",
			number: true,
			deleteButton: true
		 }, options);
		
		// 복사해서 마지막에 추가
		var html = settings.html;
		
		$(this).append(html).promise().done(function(){
		    if (typeof callback == 'function') { // make sure the callback is a function
		        callback.call(this); // brings the scope to the callback
		    }
		});		
	};
	
	$.fn.comma = function() {
		$(this).css("text-align", "right");
		$(this).on("keyup", function(){
			var val = $(this).val().replaceAll(",", "");
			$(this).val(comma(val));
		}).numericOnly();
	};
	
	$.fn.checkbox = function(options) {
	    // This is the easiest way to have default options.
	    var settings = $.extend({
	        // These are the defaults.
	    	check: null	// 체크박스
	    }, options );
	    var $checkAll = $(this);
	    var $check = settings.check;
	    
	    $checkAll.on("click", function(){
	    	$check.filter(":enabled").prop("checked", $(this).is(":checked"));
		});
		
	    $check.on("change", function(){
			var total = $check.filter(":enabled").length;
			var checkLen = $check.filter(":checked").length;
			
			if(total == checkLen){
				$checkAll.prop("checked", true);
			} else {
				$checkAll.prop("checked", false);
			}
		}).change();	
	};
	
	$.fn.newline = function() {
		$(this).html($(this).html().replace(/\n/g, '<br />'));
	};	
});

function newline(val){
	return val.replace(/\n/g, '<br />');
}

function initChosen(){
	var config = {
		 '.chosen-select'           : {
			 	 search_contains: true
			 	,max_selected_options: 10
			 	,width: "365px"
			 }
		,'.chosen-select-deselect'  : {
				 allow_single_deselect:true
				,max_selected_options:10
			}
		,'.chosen-select-no-single' : {
				 disable_search_threshold:10
				,max_selected_options:10
			}
		,'.chosen-select-no-results': {no_results_text:'조회 결과가 없습니다.'}
		,'.chosen-select-width'     : {
				 width:"95%"
				,max_selected_options:10
			}
	};
       
	for (var selector in config) {
		$(selector).chosen(config[selector]);
		$(selector).trigger('chosen:updated');
	}	
}

function processAuthorization(){
	
	if (this.className == null || this.className.length == 0) return;
	
	if(READ != 'Y'){
		if(this.className.indexOf("read".toLowerCase()) != -1 ){
			$(this).remove();
		}
	}
	
	if(WRITE != 'Y'){
		if(this.className.indexOf("write".toLowerCase()) != -1 ){
			$(this).remove();
		}
	}
}

// 현재회기
function thisSessionYear(){
	var thisSessionYear = Date.today().toString("yyyy");
	var mmdd = Date.today().toString("MMdd");
	
	if(mmdd > "0630"){
		thisSessionYear = thisSessionYear + 1;
	}
	return thisSessionYear;
}

/**
 * yyyyMMdd 를 받아서 회기년도를 반환한다.
 * @param date
 * @returns
 */
function dateToSessionYear(date){
	
	var d = date.replaceAll(".", "");
	var monthDay = d.substring(4,8);
	var sessionYear = d.substring(0,4);
	
	if(monthDay > "0630"){
		sessionYear = sessionYear + 1;
	}
	
	return sessionYear;
	
	
}

// 조직검색 팝업
function organSearchPopup(settings){
	var params = "";
	if(settings != undefined){
		$.each(settings, function(index, object) {
		    if(index == 0){
		    	params += "?" + object.name + "=" + object.value;
		    } else {
		    	params += "&" + object.name + "=" + object.value;
		    }
		}); 	
	}
	
	openPopup("/common/organ/organSearchPopup.do" + params, '700', '400', "organSearchPopup");
}


// 회원 리스트 팝업
function memberSearchPopup(settings){
	var params = "";
	if(settings != undefined){
		$.each(settings, function(index, object) {
		    if(index == 0){
		    	params += "?" + object.name + "=" + object.value;
		    } else {
		    	params += "&" + object.name + "=" + object.value;
		    }
		}); 	
	}
	
	openPopup("/common/member/memberSearchPopup.do" + params, '1000', '400', "recommMemberName");
}

function authenticatedUser(){
	var _result = 0;
	$.ajax({
		type: "POST",
		async: false,		
		url:  '/authenticatedUser.do',
		dataType: 'json',
		success: function(data) {
			_result = data.result;
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
	
	return _result;
}

function closeWin(){
	opener._popup = null;
	window.close();
}

function linkPage(pageNum){
	$("#pageIndex").val(pageNum);
	$("form").eq(0).submit();
}

function goUrlSubmit(url){
	$("form").eq(0).prop("action", url);
	$("form").eq(0).submit();
}

function openPopup(url, popWidth, popHeight, popupName){ 
	var winHeight = document.body.clientHeight; // 현재창의 높이 
	var winWidth = document.body.clientWidth; // 현재창의 너비 
	var winX = window.screenX || window.screenLeft || 0;// 현재창의 x좌표 
	var winY = window.screenY || window.screenTop || 0; // 현재창의 y좌표 
	
	var popX = winX + (winWidth - popWidth)/2; 
	var popY = winY + (winHeight - popHeight)/2; 
	
	popupName == null ? "popup" : this.popupName;
	_popup = window.open(encodeURI(url), popupName,"width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX); 
} 

function goUrl(url){
	var local = $.url(location.href);
	var menuId = local.param("menuId") == null ? $("form").eq(0).find("#menuId").val() : local.param("menuId");
	
	if($.url(url).param("menuId") != null){
		location.href = $.url(url).attr("path") + "?" + encodeURI($.url(url).attr("query"));		
	} else {
		var query = $.url(url).attr("query");
		if(query != ""){
			query = "&" + query; 
		}
		location.href = $.url(url).attr("path") + "?menuId=" + encodeURI(menuId) + query;	
	}
}

/**
 * 전화번호 하이픈 입력
 * @param object
 */
function gfnTel(val){
	var tel = val.toString().replace(/(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	return tel;
}

/**
 * 숫자콤마 입력
 * @param object
 */
function comma(val){
	var num = "";
	if(val != null){
		num = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	
	}
	return num;
}

/* 천단위 출력
 * 사용법 : payComma(12345); 
 */
function payComma(num) {
	var len, point, str; 
	num = num + ""; 
	point = num.length % 3;
	len = num.length; 
	str = num.substring(0, point); 
	while (point < len) { 
		if (str != "") str += ","; 
		str += num.substring(point, point + 3); 
		point += 3; 
	}
	return str; 
}

//특정날짜들 배열
var disabledDays = ["2013-7-9","2013-7-24","2013-7-26"];

// 주말(토, 일요일) 선택 막기
function noWeekendsOrHolidays(date) {
	var noWeekend = jQuery.datepicker.noWeekends(date);
	return noWeekend[0] ? [true] : noWeekend;
}

// 일요일만 선택 막기 
function noSundays(date) { 
  return [date.getDay() != 0, '']; 
} 

// 이전 날짜들은 선택막기
function noBefore(date){
	var sdate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var ndate = new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
	
	if (date < new Date()){
		if(sdate == ndate){
			return [true];
		} else {
			return [false];	
		}
	}
	return [true];
}

// 특정일 선택막기
function disableAllTheseDays(date) {
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	for (i = 0; i < disabledDays.length; i++) {
		if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
			return [false];
		}
	}
	return [true];
}

function objToString(obj) {
    var str = '';
    for (var p in obj) {
        if (obj.hasOwnProperty(p)) {
            str += p + '::' + obj[p] + '\n';
        }
    }
    return str;
}

// 시작날짜가 종료날짜보다 크면 false를 리턴한다.
function rangeDateCheck(startDate, endDate){
	var dateCheck = true;
	if (startDate.replaceAll(".") > endDate.replaceAll(".")) {
		dateCheck = false;
	}
	
	return dateCheck;
}

// object를 string로
function objToString (obj) {
    var str = '';
    for (var p in obj) {
        if (obj.hasOwnProperty(p)) {
            str += p + '::' + obj[p] + '\n';
        }
    }
    return str;
}

function logout(){
	location.href = "/j_spring_security_logout";
}
/**
Auth : shkim
Description : 파일업로드시 , 파일명과 확장자 추출
**/

 

/**
사용예제 :
var str = obj.value;
var str2 = event.srcElement.value;

var filename = comChk_mExtract_FileName( str );
var ext = comChk_mExtract_Ext( str );
**/
function fileName( str ){
   //전체경로에서.. 파일명만 추출.

   var len = str.length;
   var last = str.lastIndexOf("\\"); // 파일명 추출
   //var dif = len - last;
   //var ext = str.substr(last + 1, dif);  //파일명 추출 ( 제외)
   var ext = str.substring(last + 1, len);  //파일명 추출 ( 제외)

   return ext;
}//mExtractFileName


function fileExt( str ){
   //확장자 추출..
   //결과값 : false  .확장자

   var len = str.length;

   var last = str.lastIndexOf("."); //확장자 추출
   if( last == -1 ){ //. 를 발견하지 못한다면.
      return false; //확장자가 없음.
   }

   //var ext = str.substr(last, len - last );  //확장자 추출 (. 포함)
   var ext = str.substring(last, len);  //확장자 추출 (. 포함)

   ext = ext.toLowerCase(); //소문자로.
   return ext; //.jpg
}//mExtractExt


/**
 * 조직코드를 6자리를 입력받아서 000-000형식으로 반환한다.
 * @param organCode
 * @returns
 */
function formatOrganCode(organCode){
	if(!organCode.isEmpty()){
		organCode = organCode.substring(0,3) + "-" + organCode.substring(3,6);
	}
	
	return organCode;
}

function isNumber(value) { 
    return typeof value === 'number' && isFinite(value);
}

function getAge(birth) { 
	var year = Date.today().toString("yyyy"); 
	return (year - birth) + 1; // 우리나라 나이 표시 +1 더함 
}

function isMobile() {
    var filter = "win16|win32|win64|mac|macintel";
    if( navigator.platform  ){
    	if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
    		return true;
    	}else{
    		return false;
    	}
    }
}

/**
 * 라이온스 공통 팝업
 * 사용예)
 * 
   new lions.popup({
		 url: '/MM1/MM1_3/MM1_14/registerPopup.do' // 팝업url
		,name: "registerPopup"	// 팝업명
		,oncomplate: function(data){	// 팝업에서 선택시 콜백
			alert(data.action);
		}
		,width: "200px"	// 팝업창 가로 크기
		,height: "200px"	// 팝업창 세로 크기
	}).open();
 */
window.lions = window.lions || {};
var initializer = function (a, b, c) {
	function init(callback){
		if(callback.width === undefined){
			callback.width = 700;
		}
		
		if(callback.height === undefined){
			callback.height = 300;
		}
		
		if(callback.name === undefined){
			callback.name = "popup";
		}
		
		var data = "";
		if(callback.data != undefined){
			$.each(callback.data, function(index, object) {
			    if(index == 0){
			    	data += "?" + object.name + "=" + object.value;
			    } else {
			    	data += "&" + object.name + "=" + object.value;
			    }
			}); 	
		}
		
		callback.data = data;
		
		this._opt_ = callback;
	}
	
	function p(opt){
		var popup = window.open(encodeURI(opt.url + opt.data), opt.name, 'width='+ opt.width +',height='+ opt.height);
		
		opt.timer = setInterval(function(){
			try{
				if("done" === popup.action){
					opt.oncomplate(popup);
					popup.close();
					clearInteval(opt.timer);
					opt.timer = null;
				}
			} catch (f){
				clearInterval(opt.timer);				
			}
		}, 200);
	}
	
	return init.prototype = {
		open: function () {
			var opt = this._opt_;
			p(opt);
		}
	}, {
		getModule: function () {
			return init;
		}
	}
}(window, document, location);

!
function () {
	lions.popup = initializer.getModule();
}(window);


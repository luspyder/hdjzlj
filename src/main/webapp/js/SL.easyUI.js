var SL = $.extend({}, SL);
SL.showWindow = function (options) {
    var opts = $.extend({
        title: options.title,
        iconCls: options.iconCls,
        width: options.width === undefined ? 600 : options.width,
        height: options.height === undefined ? 400 : options.height,
        minimizable: false,
        maximizable: false,
        collapsible: false,
        // left : options.left === undefined ? 100 : options.left,
        top: options.top === undefined ? 100 : options.top,
        cache: false,
        onClose: function () {
            $(this).window('destroy');
        },
        loadingMessage: '正在加载数据，请稍等片刻......'
    }, options);
    opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
    if (options.url) {
        opts.href = options.url;
    }
    if (options.content) {
        opts.content = options.content;
    }
    return $('<div id="win" />').dialog(opts);
};
SL.closeWindow = function () {
    $('#win').dialog('close');
};
SL.openWindow = function () {
    $('#win').dialog('open');
};
/**
 * 弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
 */
SL.msgShow = function (title, msgString, msgType) {
    $.messager.alert(title == null ? "提示" : title, msgString,
        msgType == null ? "warning" : msgType);
}

SL.sysSlideShow = function (options) {
    $.messager.show({
        title: '提示',
        msg: options.msg,
        timeout: 1200,
        showType: 'slide'
    });
};
/**
 * 获取url中参数
 *
 * @param name
 * @returns
 */
function GetRequest() {
    var url = location.search; // 获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
// 格式化时间
function myformatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}

function myparser(s) {
    if (!s)
        return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0], 10);
    var m = parseInt(ss[1], 10);
    var d = parseInt(ss[2], 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
}
function CurentTime() {
    var now = new Date();
    var year = now.getFullYear(); // 年
    var month = now.getMonth() + 1; // 月
    var day = now.getDate(); // 日
    var hh = now.getHours(); // 时
    var mm = now.getMinutes(); // 分
    var ss = now.getSeconds(); // 秒
    var clock = year + "-";
    if (month < 10)
        clock += "0";
    clock += month + "-";
    if (day < 10)
        clock += "0";
    clock += day + " ";
    if (hh < 10)
        clock += "0";
    clock += hh + ":";
    if (mm < 10)
        clock += '0';
    clock += mm + ":";
    if (ss < 10)
        clock += '0';
    clock += ss;
    return (clock);
}
Date.prototype.format = function (format) {
    var args = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var i in args) {
        var n = args[i];
        if (new RegExp("(" + i + ")").test(format)) format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
    }
    return format;
};
/**
 * Created by maxh on 2017-03-28.
 */

// $(function () {
//     $('.wu-side-tree a').bind("click", function () {
//         var title = $(this).text();
//         var url = $(this).attr('data-link');
//         var iconCls = $(this).attr('data-icon');
//         var iframe = $(this).attr('iframe') == 1 ? true : false;
//         addTab(title, url, iconCls, iframe);
//     });
// })
function addNav(data) {
    $.each(data, function (i, sm) {
        var menulist = "";
        menulist += '<ul class="easyui-tree wu-side-tree">';
        $.each(sm.children, function (j, o) {
            menulist += '<li iconCls="' + o.icon + '"><a href="javascript:void(0)" data-icon="' + o.icon + '" data-link="' + o.url + '" iframe="1">' + o.name + '</a></li>';
        });
        menulist += '</ul>';
        $('#wnav').accordion('add', {
            title: sm.name,
            content: menulist,
            iconCls: sm.icon
        });
    });
    var pp = $('#wnav').accordion('panels');
    var t = pp[0].panel('options').title;
    $('#wnav').accordion('select', t);
    $('.wu-side-tree a').bind("click", function () {
        var title = $(this).text();
        var url = $(this).attr('data-link');
        var iconCls = $(this).attr('data-icon');
        var iframe = $(this).attr('iframe') == 1 ? true : false;
        addTab(title, url, iconCls, iframe);
    });
}
// 初始化左侧
function InitLeftMenu() {
    hoverMenuItem();
    $('#wnav li a').live('click', function () {
        var tabTitle = $(this).children('.nav').text();
        var url = $(this).attr("rel");
        var menuid = $(this).attr("ref");
        var icon = getIcon(menuid, icon);
        addTab(tabTitle, url, icon);
        $('#wnav li div').removeClass("selected");
        $(this).parent().addClass("selected");
    });

}
/**
 * Name 添加菜单选项
 * Param title 名称
 * Param href 链接
 * Param iconCls 图标样式
 * Param iframe 链接跳转方式（true为iframe，false为href）
 */
function addTab(title, href, iconCls, iframe) {
    var tabPanel = $('#wu-tabs');
    if (!tabPanel.tabs('exists', title)) {

        if (iframe) {
            tabPanel.tabs('add', {
                title: title,
                content: createFrame(href),
                iconCls: iconCls,
                fit: true,
                cls: 'pd3',
                closable: true
            });
        } else {
            tabPanel.tabs('add', {
                title: title,
                href: createFrame(href),
                iconCls: iconCls,
                fit: true,
                cls: 'pd3',
                closable: true
            });
        }
    }
    else {
        tabPanel.tabs('select', title)
        var selTab = tabPanel.tabs('getSelected');
        tabPanel.tabs('update', {
            tab: selTab,
            options: {
                content: createFrame(href)
            }
        })
    }
}

function createFrame(url){
    if (url) {
        return '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    } else {
        return '未实现';
    }
 }
/**
 * 菜单项鼠标Hover
 */
function hoverMenuItem() {
    $(".easyui-accordion").find('a').hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });
}
/**
 * Name 移除菜单选项
 */
function removeTab() {
    var tabPanel = $('#wu-tabs');
    var tab = tabPanel.tabs('getSelected');
    if (tab) {
        var index = tabPanel.tabs('getTabIndex', tab);
        tabPanel.tabs('close', index);
    }
}
/**
 * Name 选项卡初始化
 */
$('#wu-tabs').tabs({
    tools: [{
        iconCls: 'icon-reload',
        border: false,
        handler: function () {

        }
    }]
});

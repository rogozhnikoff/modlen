/**
 * Created by Roma on 18.07.2014.
 */
/**
 * Devrama-Lazyload Version 0.9.3
 * Developed by devrama.com
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
(function(b){var e=function(a,c){this.type="window";this.loading_list={};this.options={effect:"fadein",data_attr_name:"lazy-src"};b.extend(this.options,c);null!==a?(this.type="box",this.$container=this.$element=b(a),"static"==this.$element.css("position")&&this.$element.css("position","relative")):(this.type="window",this.$element=b(document),this.$container=b(window))};e.prototype={constructor:e,_init:function(){this.$element.find("."+this.options.classBackupLink).css("display","none");this._init_loading_list();
    this._on_scroll()},_on_scroll:function(){var a=this;this.$container.off("scroll.drlazyload.image");this.$container.on("scroll.drlazyload.image",function(b){a._lazyload()})},_init_loading_list:function(){var a=this;this.$element.find("[data-"+this.options.data_attr_name+"]").each(function(c,f){var g=null;b(this).data("size")&&(g=b(this).data("size").split(":"));var d;if("A"==b(this).prop("nodeName")){var h;h=b(this).data(a.options.data_attr_name)&&""!=b(this).data(a.options.data_attr_name)?b(this).data(a.options.data_attr_name):
    b(this).attr("href");b(this).replaceWith('<img src="" class="lazyload-'+c+'"/>');d=a.$element.find(".lazyload-"+c+":first");d.data(a.options.data_attr_name,h)}else d=b(this);a.loading_list[c]=d;d.attr("src","data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==");null!==g&&(""!=g[0]&&d.css("width",g[0]+"px"),""!=g[1]&&d.css("height",g[1]+"px"))});a._lazyload()},_lazyload:function(){var a=this,c=this.$container.scrollTop()+this.$container.height();b.each(this.loading_list,
    function(f,g){image_position="window"==a.type?g.offset():g.position();if(image_position.top+g.outerHeight()>=a.$container.scrollTop()&&image_position.top<=c){var d=a.options.data_attr_name,h=b(this),e=new Image;e.onload=e.onerror=function(){h.hide();h.attr("src",h.data(d));switch(a.options.effect){case "fadein":h.fadeIn();break;case "none":h.show();break;default:h.show()}};e.src=b(this).data(d);delete a.loading_list[f]}})}};b.DrLazyload=function(a){var c=b(window),f=c.data("DrLazyload");f||c.data("DrLazyload",
    f=new e(null,a));f._init();return this};b.DrLazyload.Constructor=e;b.fn.DrLazyload=function(a){if("string"===typeof a){var c=b(this),f=c.data("DrLazyload");f||c.data("DrLazyload",f=new e(this,a));return f[a].apply(f,Array.prototype.slice.call(arguments,1))}return this.each(function(){var c=b(this),d=c.data("DrLazyload");d||c.data("DrLazyload",d=new e(this,a));d._init()})};b.fn.DrLazyload.Constructor=e})(jQuery);
windowLoad = ->
  $("#container").masonry
    # указываем элемент-контейнер в котором расположены блоки для динамической верстки
    itemSelector: ".item"
    isFitWidth: true
    columnWidth: 320

    # указываем класс элемента являющегося блоком в нашей сетке
    singleMode: false

    # true - если у вас все блоки одинаковой ширины
    isResizable: true

    # перестраивает блоки при изменении размеров окна
    isAnimated: true

    # анимируем перестроение блоков
    animationOptions:
      queue: false
      duration: 500


# Проверка на цифру в сердечке.
checHeartNum = ->
  like = $(".like-this__heart")
  numb = like.text() #забираем строку
  numint = parseInt(numb) #приводим к числу
  if numint >= 1 # Если равно или больше 1, добавляем класс todo: Не пашет сраная проверка!
    like.addClass "active"
  else
    like.removeClass "active" #В другом случае, убираем
  return


ready = ->
  do ->
    # lazy load for imgs
    $.DrLazyload()
    checHeartNum()

    #lazy load
    $(".more-btn").click (e) ->
      e.preventDefault()
      imgs = $("#putinHuilo").find("img")
      imgs.attr "src", ->
        $(this).data "src"

      $("#putinHuilo").toggle("display", "block") {}
      $(window).load ->
        $("#container").masonry

        # указываем элемент-контейнер в котором расположены блоки для динамической верстки
          itemSelector: ".item"
          isFitWidth: true
          columnWidth: 320

        # указываем класс элемента являющегося блоком в нашей сетке
          singleMode: false

        # true - если у вас все блоки одинаковой ширины
          isResizable: true

        # перестраивает блоки при изменении размеров окна
          isAnimated: true

        # анимируем перестроение блоков
          animationOptions:
            queue: false
            duration: 500

        return

      return


      # опции анимации - очередь и продолжительность анимации

  do ->
    # Схлопываем заказ
    closed = $(".order-info__icon")
    closed.click ->
      $("#closed").slideToggle 800
      if closed.hasClass("fa-plus-square-o")
        closed.removeClass "fa-plus-square-o"
      else
        closed.addClass "fa-plus-square-o"
      return

  do ->
    # Выбираем цвет
    color = $(".color-choice__item")
    colorin = "color-choice__item_active"
    link = $(".color-choice__link")
    color.click ->
      $(this).addClass "color-choice__item_active"
      $(this).siblings().removeClass colorin
      return

  do ->
    # Скриваем/показываем пароль
    pass = $("#pass")
    eye = $(".input-wrap__eye")
    eye.click (e) ->
      e.preventDefault()
      if pass.attr("type") is ("password")
        pass.attr "type", "text"
      else
        pass.attr "type", "password"
      return

  do ->
    # payment cvv/cvc code show
    # *
    #* Фокус поля ввода цвв кода
    #* block payment__arrow показываем add css display block
    #* меняем картинке бекграунд position 0 -210px add class payment__bank-card_code
    #* payment__card-description display block css. display block
    #* при блюре, меняем все назад
    #*
    cvc = $(".payment__input-cvv")
    $(cvc).focus ->
      $(".payment__arrow").show()
      $(".payment__bank-card").addClass "payment__bank-card_code"
      $(".payment__card-description").show()
      return

    cvc.blur ->
      $(".payment__bank-card").removeClass "payment__bank-card_code"
      $(".payment__arrow").hide()
      $(".payment__card-description").hide()
      return

  do ->
    #
    # * подписваемся на клик по лейбу.
    #  * добавляем класс лейбу актив
    #  * у соседей, убираем класс актив
    #  * связываем событие с контентом внизу.
    #  * вешаем соседям hide, и вешаем нужному блоку show
    #  *
    #
    $(".method-list__item").click (ev) ->
      ev.preventDefault()
      item = $(this).closest(".method-list__item")
      tabs = $(".payment__card")
      itemPos = item.data("class")
      console.log itemPos, 1
      tabs.filter(".payment__card_" + itemPos).addClass("active").siblings().removeClass "active"
      item.addClass("method-list__item_active").siblings().removeClass "method-list__item_active"
      return

  do ->
    like = $(".head__cart-circle")
    numb = like.text() #забираем строку
    numint = parseInt(numb) #приводим к числу
    like.each addLikes = ->
      if numint >= 1 # Если равно или больше 1, добавляем класс
        like.addClass "active"
      else
        like.removeClass "active" #В другом случае, убираем
      return

  do ->
    # Валюта
    cur = $(".currency__text")
    cur.click (e) ->
      e.preventDefault()
      cur.siblings().removeClass "active"
      $(this).addClass "active"
      return

  do ->
    #Навигация шапки горизониальная
    navi = $(".navi-list__item")
    navLink = $(".navi-list__link")
    navi.click (e) ->
      e.preventDefault()
      navi.siblings().removeClass "active"
      $(this).addClass "active"
      return

  do ->
    #gallery in property
    gallery = $(".property__img img")
    gallery.click (e) ->
      e.preventDefault()
      link = $(this)
      img = link.find("img")
      src = img.attr("src")
      imgLarge = $(".property__large-img img")
      imgLarge.attr "src", src
      $(".property__large-img").show()
      imgLarge.click ->
        imgLarge.attr "src", "none"
        $(".property__large-img").hide()
        return

      return


  do ->
    #popup
    $("a.login_modal_a").click (ev) ->
      ev.preventDefault()
      $(this).next().click()
      return

    popupLink = $(".head__my-link")
    popup = $(".pop-up-sign")
    head = $(".wrapper")
    footer = $(".foot")
    close = $(".popup-sign__close")
    blur = "blurJS"
    popupLink.click (e) ->
      if popupLink.text() is "My Modlen"
        e.preventDefault()
        popup.addClass "active"
        head.add(head).add(footer).addClass blur
      return

    close.click (e) ->
      e.preventDefault()
      popup.removeClass "active"
      head.add(head).add(footer).removeClass blur
      return



  do ->
    # Options
    items = $(".measure-list").find("input")
    active = "measure-list__item_blue"
    wrongItem = "measure-list__item_error"
    wrongLabel = "measure-list__label_error"
    wrongInput = "measure-list__input_error"
    activeInput = "measure-list__input_blue"
    img = $(".option__mirror-img").find("img")
    imgText = $(".option__mirror-info")
    imgTextA = $(".option__videoguide")
    arrow = $("<span>").addClass("measure-list__arrow")
    x = 110
    text = {}
    $.getJSON "../../js/options.json", (data) ->
      text = data
      return

    items.on "focus", (ev) ->
      parent = $(this).addClass(activeInput).parent().addClass(active)
      lab = parent.find("label")
      src = "/assets/img/options/" + lab.attr("for") + ".jpg"
      img.attr "src", src
      img.load ->
        hFull = img.height()
        index = parseInt(parent.find("span").text())
        y = Math.round(hFull * index / 16) + $(this).offset().top - parent.offset().top - 15
        alpha = Math.round(-Math.atan2(y, x) * 180 / Math.PI - 180)

        #
        if lab.attr("for") isnt "Name" and lab.attr("for") isnt "Age"
          arrow.css(
            width: Math.round(Math.sqrt(x * x + y * y))
            transform: "rotate(" + alpha + "deg)"
          ).appendTo parent
        $(this).off()
        return

      imgText.html text[lab.attr("for")].text
      imgTextA.attr "href", text[lab.attr("for")].url
      return

    items.on "blur", (ev) ->
      parent = $(this).parent().removeClass(active)
      unless validateOption($(this))
        parent.addClass wrongItem
        $(this).addClass(wrongInput).removeClass activeInput
        parent.find("label").addClass wrongLabel
      else
        parent.removeClass wrongItem
        $(this).removeClass(wrongInput).removeClass activeInput
        parent.find("label").removeClass wrongLabel
      return



validateOption = ($el) ->
  value = parseInt($el.val())
  return true  unless $el.parent().find("label").text().indexOf("name") is -1
  return false  if isNaN(value) or value < 1 or value > 250
  true

$(window).load windowLoad
$(document).ready ready
$(document).on "page:load", ready
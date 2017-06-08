<?php echo $header; ?>
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
                <div class="err404-title">
                    <h1>Ваша корзина пуста</h1>
                    <p>Но это никогда не поздно исправить :)</p>
                </div>
                <div class="err404-description">
                    <p><a href="/"><span class="err404-button">Начать покупки</span></a></p>
                </div>
                <div class="err404-content">
                    <article class="err404-content-left">
                        <div class="err404-content-image">
                            <img src="catalog/view/theme/stroyzona/image/chelik_2.png" alt="" />
                        </div>
                    </article>
                    <article class="err404-content-right">
                        <div class="err404-content-post-pointer">
                            <div class="err404-content-post-pointer-i i1">
                                <a href="/teploizolyaciya" title="" class="">
                                    Теплоизоляция
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i2">
                                <a href="/gidroizolyaciya" title="" class="">
                                    Гидроизоляция
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i3">
                                <a href="/electroinstrument-i-oborudovanie" title="" class="">
                                    Электро-инструменты
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i4">
                                <a href="/skatnaya-krovlya" title="" class="">
                                    Скатная кровля
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i5">
                                <a href="/fasady" title="" class="">
                                    Фасады
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i6">
                                <a href="/bitumnaya-cherepica" title="" class="">
                                    Битумная черепица
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i7">
                                <a href="/ploskie-krovli" title="" class="">
                                    Плоская кровля
                                </a>
                            </div>
                            <div class="err404-content-post-pointer-i i8">
                                <a href="/evroruberoid" title="" class="">
                                    Еврорубероид
                                </a>
                            </div>
                        </div>
                    </article>
                </div>

                <div class="clear"></div>
                <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
    </div>
<?php echo $footer; ?>
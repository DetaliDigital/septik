<form id="{$formID}_form" class="mvtForm2" method="post">

    <input type="hidden" name="{$formID}_resource" value="{'id' | resource}">
    <input type="hidden" name="token" value="{$token}">
    <input type="hidden" name="form" value="{$formID}">
    <input type="hidden" name="{$formID}_address" id="dsmc_address" value="">
    <input type="hidden" name="{$formID}_product_id" id="dsmc_calc_product_id" value="">
    <input type="hidden" name="{$formID}_cost_equipment" id="dsmc_calc_cost_equipment" value="">
    <input type="hidden" name="{$formID}_cost_distance" id="dsmc_cost_distance" value="">
    <input type="hidden" name="{$formID}_cost_tube" id="dsmc_cost_tube" value="{($.get.calc_input_tube * 700) | number : 0 : '.' : ' '}">
    <input type="hidden" name="{$formID}_cost_earth" id="dsmc_cost_earth" value="">
    <input type="hidden" name="{$formID}_cost_installation" id="dsmc_cost_installation" value="">
    <input type="hidden" name="{$formID}_tolalcost" id="dsmc_tolalcost" value="">

    <div class="row align-items-center my-4">
        <div class="flex w-100">
            <div class="col-12">
                <h4>Выберите уровень сервиса</h4>
            </div>
            <div class="mt-4 mb-0 d-flex align-items-center">
                <div class="custom-control custom-radio ml-3 my-2">
                    <input class="custom-control-input checker checker1" type="radio" name="{$formID}_sla" id="{$formID}_sla1" value="Решение под ключ" checked="">
                    <label class="custom-control-label" for="{$formID}_sla1">Решение «под ключ»</label>
                </div>
                <div class="custom-control custom-radio ml-3">
                    <input class="custom-control-input checker" type="radio" name="{$formID}_sla" id="{$formID}_sla2" value="Только оборудование">
                    <label class="custom-control-label" for="{$formID}_sla2">Только оборудование</label>
                </div>
            </div>
        </div>
    </div>
    <div class="total border-top py-5">
        <div class="row mx-0">
            <div class="col-12 col-md-12 col-lg-6 p-5 bg-success-2 text-white" id="estimate" style="transition:0.5s">
                <div class="calc-total_panel">
                    <div class="title h6 mb-3">Смета на монтаж "Под ключ"</div>
                    <div class="row">
                        <div class="col-md-6 col-12">Оборудование - <span class='cost_equipment'>0</span> {'ms2_frontend_currency' | lexicon}</div>
                        <div class="col-md-6">Трубы - <span class='cost_tube' data-calc_input_tube="{($.get.calc_input_tube * 700)}">{($.get.calc_input_tube * 700) | number : 0 : '.' : ' '}</span> {'ms2_frontend_currency' | lexicon}</div>
                        <div class="col-md-6">Земельные работы - <span class='cost_earth work'>0</span> {'ms2_frontend_currency' | lexicon}</div>
                        <div class="msdom_delivery_distance col-md-6 d-block">Расстояние: <span class="range_delivery"></span> км</div>
                        <div class="col-md-6">Монтаж - <span class='cost_installation'>0</span> {'ms2_frontend_currency' | lexicon}</div>
                        <div class="msdom_delivery_cost col-md-6 d-block">Доставка: <span class="cost_delivery"></span>
                            <span class="msdom_suffix">{'ms2_frontend_currency' | lexicon}</span></div>
                        <div class="col-md-6">Водоотведение - <span class='cost_drainage' data-value="{$.get.calc_drainage_system == 'Принудительный' ? '6 300' : $.get.calc_drainage_system == 'Самотеком'? '10 000' : $.get.calc_drainage_system == 'Сброс на рельеф, в канаву' ? '0' : '0'}">{$.get.calc_drainage_system == 'Принудительный' ? '6 300' : $.get.calc_drainage_system == 'Самотеком'? '10 000' : $.get.calc_drainage_system == 'Сброс на рельеф, в канаву' ? '0' : '0'}</span> р.</div>


                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 img-equipment d-flex align-items-center justify-content-center border-top border-bottom">

            </div>
            <div class="dsmc-calc-finalcost col-md-9 col-lg-3 p-5 border-top border-bottom border-right">
                <div class="calc-title h4">Юниан Астра 3</div>
                <div class="h5 font-weight-bold" id="final-cost" style="color: #61b955; transition: 0.5s;"><span class="calc-final-cost">0</span> {'ms2_frontend_currency' | lexicon}</div>
            </div>
        </div>
    </div>
    <h2 class="h5">Место проведения работ</h2>

    <p class="my-5">
        Просто укажите на карте точное место доставки. Доставка оборудования на ваш участок в пределах 50 км от нашего склада осуществляется бесплатно. Доставка на большее расстояние рассчитывается по схеме 30 рублей за 1 км пути. Если ваш участок находится в 55 км от нашего склада, то доставка будет стоить 150 рублей.
    </p>

    {'!msDom' | snippet : [
    'tplOuter' => 'tpl.msDom.map.outer.septic.calc',
    'tplInput' => '@INLINE <input type="text" id="septic_city" name="septic_city" placeholder="[[%msdom_input_placeholder]]" value="" class="form-control form-control-lg">'
    ]}

    <h2 class="mt-4 h5">Контакты для обратной связи</h2>
    <div class="row">
        <div class="form-group col-xl-6">
            <div class="input-group">
                <div class="input-group-prepend">
        <span class="input-group-text">
            <i class="far fa-user"></i>
        </span>
                </div>
                <input class="form-control form-control-lg" name="{$formID}_name" type="text" placeholder="Ваше имя*">
            </div>
        </div>
        <div class="form-group col-xl-6">
            <div class="input-group">
                <div class="input-group-prepend">
        <span class="input-group-text">
            <i class="fas fa-phone-alt"></i>
        </span>
                </div>
                <input class="form-control form-control-lg mvtFormPhone" name="{$formID}_phone" type="text" placeholder="Ваш телефон*">
            </div>
        </div>
    </div>
    <div class="row align-items-center">
        <div class="form-group col-xl-8 mb-0">
            <input type="checkbox" id="{$formID}_accept" name="{$formID}_accept" checked="" style="display:none;">
            <label class="form-check-label text-dark" for="{$formID}_accept">
                <svg width="18px" height="18px" viewBox="0 0 18 18">
                    <path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
                    <polyline points="1 9 7 14 15 4"></polyline>
                </svg>
                <!--noindex--><span>Я согласен с <a class="text-dark" href="{'340' | url}" title="политика конфиденциальности">политикой конфиденциальности</a></span><!--/noindex-->
            </label>

        </div>
        <div class="col-xl-4 mt-4 mt-xl-0">
            <button style="width: 100%;" id="{$formID}_form_submit" class="btn btn-success btn-lg" type="submit">Отправить</button>
        </div>
    </div>
</form>
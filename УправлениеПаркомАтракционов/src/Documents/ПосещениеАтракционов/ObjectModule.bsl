
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ,Режим)
	// регистр АктивныеПосещения
	Движения.АктивныеПосещения.Записывать = Истина;
	Движение = Движения.АктивныеПосещения.Добавить();
	Движение.Период = Дата;
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Основание = Основание;
	Движение.Атракцион = Атракцион;
	Движение.КоличествоПосещений = 1;
	
	Движения.Записать();
	
	Запрос = Новый Запрос;
	
	Запрос.Текст = "ВЫБРАТЬ
	|	АктивныеПосещенияОстатки.Основание
	|ИЗ
	|	РегистрНакопления.АктивныеПосещения.Остатки(, Основание = &Основание) КАК АктивныеПосещенияОстатки
	|ГДЕ
	|	АктивныеПосещенияОстатки.КоличествоПосещенийОстаток < 0";
	Запрос.УстановитьПараметр("Основание", Основание);
	РезультатЗапроса=Запрос.Выполнить();

	Если Не РезультатЗапроса.Пустой() Тогда
		Отказ=Истина;
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Билет уже использовался, поторно запрещено!";
		Сообщение.УстановитьДанные(ЭтотОбъект); //Ссылка на объект ИБ
		Сообщение.Сообщить();
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти

#Область Инициализация

#КонецОбласти

#КонецЕсли

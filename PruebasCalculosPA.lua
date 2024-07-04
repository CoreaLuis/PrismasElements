set field CRE_Moneda with "USD"
set field page with "pagina_bienvenida_1"

when field CRE_Prima change as abono do
        
    temp_prima = field CRE_Montofinanciar
    
    temp_procentaje = abono / temp_prima 
    
    temp_procentaje2 = temp_procentaje * 100
    
    set field procentaje_abono with temp_procentaje2
end


function VisibleSum(edad) do
    if val(edad) >= 18 and val(edad) < 30 then
        return 0.19
    end 
    if val(edad) >= 31 and val(edad) < 55 then
        return 0.23
    end
    if val(edad) >= 56 and val(edad) < 65 then
        return 0.28
    end
    if val(edad) >= 66 and val(edad) < 79 then
        return 0.35
    end
end

datenowDAta = date:now()

when field CRE_Prima change as prima do
    temp2 = field fecha_nacimiento
    dayN2 = date:UTCday(temp2)
    dayN = date:UTCday(datenowDAta)
    
    monthN2 = date:UTCmonth(temp2) 
    monthN = date:UTCmonth(datenowDAta) 
    
    yearN2 = date:UTCyear(temp2)
    yearN = date:UTCyear(datenowDAta)
    
    tempYear = yearN - yearN2

    tempMonth = monthN - monthN2

    tempDay = dayN - dayN2
    
    tempMonth2 = tempMonth/12 
 
    tempDay2 = tempDay/365.25

    tempYearResult = tempYear + tempMonth2 + tempDay2
    set field CLI_Edad with tempYearResult

    prima1  = field CRE_Montofinanciar
    MontoFinanciar = prima1 - prima
    set field CRE_Montoprestamo with MontoFinanciar

    temp = VisibleSum(tempYearResult)
        
    resultv1 = temp * MontoFinanciar
    resultv2 = resultv1 / 1000
    abonoporciente = resultv2 * 0.05
    resultv3 =  resultv2 + abonoporciente
    
    set field CLI_Seguro_Vida with resultv3
 end
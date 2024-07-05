# calculando edad 
function validateAge(dcFechaNacimiento) do
# obtenemos la fecha actual
   fechaActual = date:now()

# rastreamos y obtenemos Año, Mes y Dia de dcFechaNacimiento
  fechaNacAnio = substring(dcFechaNacimiento,0,4)
  fechaNacMes = substring(dcFechaNacimiento,5,7)
  fechaNacDia = substring(dcFechaNacimiento,8)

# obtenemos  dia, me sy año actual en UTC
  fechaActualDia = date:UTCday(fechaActual)
  fechaActualMes = date:UTCmonth(fechaActual)
  fechaActualANio = date:UTCyear(fechaActual)
 
# mayoria de edad a 21 para comprobar
 if edad == 21 then
# si el mes actual es menor al de nacimiento, restar 1 a la edad y compabamos
# si es mayor o igual a 21
 if fechaActualMes < fechaNacMes then 
    return edad - 1 >= 21
end

#Si el mes actual es igual al mes de nacimiento, comprobar el día
 if fechaActualMes == fechaNacMes and fechaActualDia < fechaNacDia then
    return edad - 1 >= 21
 end
end

return edad >= 21
end

set field esMayor with validateAge(field edad)

# calculo seguro de vida panama
function calcSeguroVida(edad) do 
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

#calculamos el monto de la prima 
when field 

# calculando CPP 
function calcCPP
   return CPP = customer.dcAbonoCLI - customer.dcPrecVenta
end

function calPorcCPP 
   return calcporcentaje = CPP /100
end

#


def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

# Respuesta 1
def average_student(average_s)
    average_s.each do |elem|
        sum = 0
        average = 0
        cont = 0
    
        elem.each_with_index do |value, index|
            if index != 0 && value !='A'
                cont += 1
                sum += value.to_i
                average = sum.to_f/cont
            end
        end
        puts "El promedio de #{elem[0]} es #{average}"
    end
end

# Respuesta 2

def student_absences(student_abse)
    student_abse.each do |elem|
        count = 0
        elem.each_with_index do |value, index|
            if index != 0 && value == 'A'
                count += 1
            end
        end
        puts "#{elem[0]} tiene #{count} inasistencias"
    end
end

# Respuesta 3

def student_aprov(aprov_s, note = 5.0)
    aprov_s.each do |elem|
        sum = 0
        average = 0
        cont = 0
        elem.each_with_index do |value,index|
            if index != 0 && value !="A"
                cont += 1
                sum += value.to_i 
            end
        end
        average = sum.to_f/cont
        if average > note
            puts "#{elem[0]}: aprobó"        
        end
    end
end

#en student se guarda el metodo del archivo Alumnos
student = read_alum("Alumnos.csv")
option = 0
while option!=4
puts "ingre una opcion :"
puts "opcion 1 ver promedio de alumnos"
puts "opcion 2 ver inasistencias"
puts "opcion 3 ver alumnos aprobados"
puts "opcion 4 Exit"
puts "---------------------------------------------------------------"

option=gets.chomp.to_i
case option
when 1
    average_student(student)
when 2
    student_absences(student)
when 3
    puts ('Ingrese nota')
    note = gets.chomp.to_f
    student_aprov(student, note)
when 4
  puts "Exit"
else
    puts "Ingrese una opcion válida"
end
end
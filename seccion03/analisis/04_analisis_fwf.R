library(tidyverse)


students_data <- read.fwf("seccion03/data/student-fwf.txt", 
                          widths = c(4,15,20, 15, 4), 
                          col.names = c("Id", "Nombre", "Email", 
                                        "Carrera", "Año"))



students_data_wh <- read.fwf("seccion03/data/student-fwf-header.txt", 
                             widths = c(4, 15, 20, 15, 4), 
                             header = TRUE, 
                             sep = "\t",
                             skip = 2)

students_data_wh

#quitando un campo


students_data_no_email <- read.fwf("seccion03/data/student-fwf.txt", 
                                   widths = c(4,15,-20, 15, 4), 
                                   col.names = c("Id", "Nombre", 
                                                 "Carrera", "Año"))

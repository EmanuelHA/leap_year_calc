#Nombre del programa
PROG = main
#Compilador C++ y sus banderillas
CC = gcc
CFLAGS = `pkg-config --cflags --libs gtk4`
# Nombre del archivo ejecutable
TARGET = calculadora
# Archivo fuente en ensamblador
ASM_SRC = $(TARGET).asm
# Archivo objeto
OBJ = $(TARGET).o
# Compilador NASM y sus banderillas
ASM = nasm
ASM_FLAGS = -f elf64
# Enlazador y sus banderillas
LD = ld
LD_FLAGS = -o $(TARGET)

# Regla por defecto
all: $(OBJ) ${PROG}

# Regla para el lanzamiento del programa
start:
	./${PROG}

# Regla para el enlazado
$(TARGET): $(OBJ)
	$(LD) $(LD_FLAGS) $(OBJ)

# Regla para la compilación del ensamblador
$(OBJ): $(ASM_SRC)
	$(ASM) $(ASM_FLAGS) $(ASM_SRC)

# Regla para la compilación del ejecutable
${PROG}: ${PROG}.c
	${CC} ${PROG}.c -o ${PROG} ${CFLAGS}

# Limpieza de archivos generados
clean:
	rm -f $(TARGET) $(OBJ)
	rm ${PROG}
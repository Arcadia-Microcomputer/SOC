BUILD_DIR = ./build
CC = riscv64-unknown-elf-gcc
CC_FLAGS = -march=rv32i -mabi=ilp32 -nostartfiles -N -T CPU.ld
ELF_FILE = prog.elf
BIN_FILE = rom.bin

make: $(BIN_FILE)
	"../../AutoCopy" $(BUILD_DIR)/$(BIN_FILE)

# Create program rom
$(BIN_FILE): $(ELF_FILE)
	riscv64-unknown-elf-objcopy -O binary --only-section=.text $(BUILD_DIR)/$(ELF_FILE) $(BUILD_DIR)/$(BIN_FILE)

# Assemble source files
$(ELF_FILE): test.s
	$(CC) $(CC_FLAGS) test.s -o $(BUILD_DIR)/$(ELF_FILE)

dmp: $(ELF_FILE)
	riscv64-unknown-elf-objdump -D --section=.text $(BUILD_DIR)/$(ELF_FILE)
	riscv64-unknown-elf-objdump -s -w --section=.data $(BUILD_DIR)/$(ELF_FILE)

dmpE: $(ELF_FILE)
	riscv64-unknown-elf-objdump -D $(BUILD_DIR)/$(ELF_FILE)

clean:
	rm -r $(BUILD_DIR)/*
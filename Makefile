# Путь к папке с .proto файлами
PROTO_PATH := proto/sso
# Путь, куда складывать сгенерированный код
GEN_PATH := gen/go/proto

.PHONY: generate
generate:
	mkdir -p $(GEN_PATH)
	protoc -I proto \
		proto/sso/sso.proto \
		--go_out=$(GEN_PATH) --go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_PATH) --go-grpc_opt=paths=source_relative

.PHONY: clean
clean:
	rm -rf gen/go/*
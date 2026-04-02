FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659 AS builder
RUN apk add --no-cache binutils
COPY hello_world_loop.asm .
RUN as hello_world_loop.asm -o hello_worldi_loop.o && ld hello_worldi_loop.o -o hello_world_loop

FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
RUN apk add --no-cache strace
COPY --from=builder /hello_world_loop /hello_world_loop
CMD ["/hello_world_loop"]

FROM haskell:9.2.4 as builder
RUN git clone https://github.com/gerardVM/ascii-animation-haskell.git
WORKDIR /ascii-animation-haskell
RUN ghc minion.hs

FROM ubuntu:18.04
COPY --from=builder /ascii-animation-haskell /animation
WORKDIR /animation
ENTRYPOINT ["./minion"]

FROM haskell:9.2.4 as builder
COPY . .
RUN ghc minion.hs

FROM ubuntu:18.04
COPY --from=builder minion .
COPY --from=builder /gifs /gifs
ENTRYPOINT ["./minion"]

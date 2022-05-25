import Control.Concurrent (threadDelay)
import System.IO (stdout, hSetBuffering, BufferMode(LineBuffering))

main :: IO ()
main = do 
     animate $ map (readFile . (++) "gifs/" . show) [1..24]
     main

animate :: [IO String] -> IO ()
animate [] = putStrLn ""
animate x = do
    hSetBuffering stdout LineBuffering
    renderFrame $ head x
    threadDelay 80000
    animate $ tail x

renderFrame :: IO String -> IO ()
renderFrame x = do 
            frame <- x
            putStr frame
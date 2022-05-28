import Control.Concurrent (threadDelay)
import System.IO (stdout, hSetBuffering, BufferMode(BlockBuffering))

main :: IO ()
main = do 
     animate $ map (readFile . (++) "gifs/" . show) [1..24]
     main

animate :: [IO String] -> IO ()
animate [] = putStrLn ""
animate x = do
    hSetBuffering stdout $ BlockBuffering (Just 260)
    renderFrame $ head x
    threadDelay 80000
    animate $ tail x

renderFrame :: IO String -> IO ()
renderFrame x = do 
            frame <- x            
            putStr frame
import Data.List (elemIndices)
import Data.Set ( Set, insert )


-- grid :: [String]
-- grid = ["......#...........#..............................#..............................#...........................##...............#....", ".............#..............#........#......##...................................................#............##...#..........#...", "...#..................#..............#.........#...#.........................................................................#..#.", ".....#..........#...................#.....................#..........#...........#......#..#...................#..................", "...#...............................................##..................#............#.....#...................#...................", ".#.#..#...................#.##.................#..........#................................#......#.........##..................#.", "....................#...................#....#.........#....................#....................................................#", "..........#......#...................................................................................................#....#.......", ".#...............#.........#...........#...............#...................#......#...............................................", "............#...........#........#..##.......#........#.....#................................##...................................", "...................#.#.............###.................##.................#.......................#.....#..............##.........", ".........................#...#............................#......#.......................#........................................", ".....................#..............................................#.......#......##......................................#......", "............................#.#............................................................................#.................#....", ".#.....#.......................................................#..........#.......................................................", "..............#..............................#.....#....#........#....................#....#.#...........#.#..................#...", "........................#...#...##......#...........................#.............#............................#..................", "...#........................................................#...#...........................#...#...............#........#........", ".........#..#..........#.....................................#..................................................................#.", "...........................................#.........#....#........................................#..#...........#...............", "..#..........#...........................................................................................#..............#.........", "...#.......#......................................#...............#...............................................................", ".#........#......#.#....................................#...#...........#..........#........#.#.......#.......................#...", "......................#...........#......##....................#..................#......#..............................#.......#.", "..............#......................#..............#...#.#............................................................#.#........", "..............#..................#...#..................#...#.....#...#...............#...........................................", ".............#............................##..#...#...............................................................##..............", "..#............................#.......#.#....................................#...................................................", ".......#.....#..........#......#.....#...................................#...........................#......#....#..............#.", ".#.................#.............................................#................#.............#.....#....................#......", "..............#.........#..#.....#...........#..............................#.................................#............#......", "....#.#............#............................................................#..........#......................................", ".........................................#.......#......#....................................#.....................#...#......#...", "....#.............................#....................................#..........#................................#..............", ".........#..#......#..............................................................#....................#..........................", ".......................................................##...#........#......................................................#.#..#", "..........................#.......##..##................................................................................#.........", "..................................##..................................................................#..........................#", ".#..................................................#..............#.....................#.....#..................................", ".......##........................#......................................................#..........#..............................", ".........#....#....#.........#.#........................#...#.....................................................#.....#.........", "....#.............................#....#....................#.....................#.....#......#.....................#..........#.", "............................................................................................#..........#......#...................", "..................................................................................#..........................#.#.....#.........#..", "..................................................#...................................................#......#.....#............#.", "..........................................^#................................................................................#.....", "...............#..........#.............................................#.....#....#...................#................#.........", "#..#....#........#........#.........#.......#.................#.......................#.#.............#...................#.......", "..#................................................................#......................................#.......................", "........#......................#.....................##.#..........#.............................#.............................#..", "....#..........#........................#.........................................................................................", "......#...#.#.#.........#.................#.....#.....#...#......#..................................................##........#...", "...#....#....................#...................................................................#......#...............#.........", "..#.......#.........................#..........#........#............................#......#....................#................", ".................................#.......................................#....................................................#..#", "......................#...#........................#.......................#.............#........................................", "......#.......#...................................................................................................#...............", ".............#............#......#............................#...........................................##......................", "..........................#.....................................................................................#.................", "....#..............................#......................#........................................#....#...........#.............", "................#.......#.........................................................................................................", ".............#............#........#.....#.........#.#.#............................#..........#..............#....#.......#.....#", "..#.....#...............................................................................................#...............#.........", ".......#...........#............#................#.......................................#..........................#......#......", "..........#........................................#......................#............#....................................#..#..", ".......#......#..............................#........................................................#.#.................#.......", ".#.................#..#.....................................................................................#...........##........", "#...................................#........................................#..............#.##........#..#.#.............#......", "......#...............#........#....#.........#.........#...#.......................#...........................#............#....", "...#...................................................................................#.......................................#..", ".....#.......................................#................#...............................................................#...", ".#................................................##................................#....................#...............#........", ".................................................#..#..................#.......#........................#...............#.....#...", ".....##.#.............................#.....................#................................................................#...#", "...........#....................#...........#...............#.................................................#.......#.......#..#", "........#....................................................#.....#....#.........................................#.....#.#.......", "...............#..........................#............#.#.................................................#......................", "...........#......#.....................#...................................................................#.#..............#....", "......#...#.........................#..........................................................#..................................", ".....................#................................................#..#........................................................", "..............#.................#............#....................#.#.......................................#............#........", "............#.....................#................#......#..........................#.#.........#............#...................", "........................................................................#.....................#...................................", ".............................#....................................................................................................", ".........................#...#..........................................#............................................#............", "..#...............................#.....#.....#.............#.......#..#.................##.#.......................#.........#.#.", "......................................#...........................................................................................", "...........#.....................................#................#...#.........................#........................#........", "..#...#..#..........................#.......#....#......................................................#................#........", ".....................................#...#.#........#...............#..#......#.....................................#...#.........", ".#..............#..............................................................#.........................##......................#", "..........#..................................#....#.........#...#.#..........#...#...................................##...........", "...............#.....................................................................................................#............", ".#.......#....................#...#..........................#.#...............#......................#........#.................#", ".............#....................#........................#..................#......#....#....#..................................", "........#..............................................................#.....................#....................................", ".......................#..............#.............#......#.........................................#.........................#..", ".......#.......#.#........#.......................#..#.......................................................#.#..................", "...............#..#....#.......................#.....#..............................#..................#.....................#....", "......#..............#...........................#............................##...........................#......................", ".......................................#........#................................#..........................#.....................", ".#.....................................#............#.............................................................#..#............", "..................#..................#.........................#............#..........#.........................#...#............", ".......................................................#..............#..........................................................#", "...#....#..#...#..#...................##....................#.....................#...................#.....#..........#..........", ".......................#........#....................##.................#.......................................................#.", "........#.......#.......................#.#......##...##........#..##.........................................#...............##..", "....#..........................#.........##..#......#...........................#........#........#...#...........................", "...#..........................#.....#.....................................#.......................................................", "....................................##.......#..............................#.............#...#......#.............#..............", ".#..............................#...............................................................................................#.", ".....#................................................................................##.....#..............#.#...................", "...........................................................................................#....#................#................", "...#..#...................................................#....#.......#.......#.................................#........#.......", ".#....#....................#..............................................................................#.............#.......#.", ".........#.................#.......................................#...........#......#.......#............#............#.........", "........................................#...............................#.........................................................", "..............#....#......................#..........#........#.....................................#...........#..........#......", "......##....#.............#..........#......................#.........................................##..........................", "....................#.............................#.....................##.#..........#..#......................###.........#.....", ".#.......................................##........................#.....#.....#..#...............................................", "..............................#............................#.......................................................##.............", ".........#.............................#..............#......#.....#..............#.#............................#........#....#..", "............#..............#.............................#..........................#.............................#...............", ".................#...........#..............#.....#..............................#.............#................#.....#...........", "........#.....................#........#.....................................#..........................#......#.#................", ".....................................................#..#........................#.##..#.........#................................", "......#..............................................#..........................#...............................#..........#......", ".................................................#.................##.......................#...................................#.", "....................#.....#.......#.............#................................#..........#...#................................."]

-- Part 1

getGuard :: [String] -> (Int, Int) -- find '^' in the grid
getGuard grid = head [(x, y) | (x, row) <- zip [0..] grid, y <- elemIndices '^' row]

guard :: (Int, Int)
guard = getGuard grid

dirs :: [(Int, Int)]
dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)] -- up, right, down, left

turnRight :: (Int, Int) -> (Int, Int)
turnRight (x, y) = (y, -x) -- (-1, 0) -> (0, 1) -> (1, 0) -> (0, -1)

isOut :: (Int, Int) -> Bool
isOut (x, y) = x < 0 || y < 0 || x >= length grid || y >= length (head grid)

isIn :: (Int, Int) -> Bool
isIn = not . isOut

terrain :: (Int, Int) -> Char
terrain (x, y) = grid !! x !! y

move :: (Int, Int) -> (Int, Int) -> (Int, Int)
move (x, y) (dx, dy) = (x + dx, y + dy)

patrol :: Set (Int, Int) -> (Int, Int) -> (Int, Int) -> Int
-- (Int, Int) -> (Int, Int) -> Int
patrol seen pos dir
    | isOut nextPos = length seen
    | terrain nextPos == '.' || terrain nextPos == '^' = patrol (insert nextPos seen) nextPos dir
    | terrain nextPos == '#' = patrol seen pos nextDir
    | otherwise = error $ "Invalid terrain: " ++ show nextPos ++ " " ++ show (terrain nextPos)
    where
        nextPos = move pos dir
        nextDir = turnRight dir

patrol' :: (Int, Int) -> (Int, Int) -> [(Int, Int)]
patrol' pos dir
    | isOut nextPos = [pos]
    | terrain nextPos == '.' || terrain nextPos == '^' = pos : patrol' nextPos dir
    | terrain nextPos == '#' = patrol' pos nextDir
    | otherwise = error $ "Invalid terrain: " ++ show nextPos ++ " " ++ show (terrain nextPos)
    where
        nextPos = move pos dir
        nextDir = turnRight dir

-- res_q1 :: Int
-- res_q1 = patrol (insert guard mempty) guard (0, -1)

grid :: [String]
grid = ["....#.....", ".........#", "..........", "..#.......", ".......#..", "..........", ".#..^.....", "........#.", "#.........", "......#..."]

-- res_q1_test :: Int
-- res_q1_test = patrol (6, 4) (-1, 0)

showRes :: [(Int, Int)] -> [String]
-- showRes res = [[if (x, y) `elem` res then 'X' else grid !! x !! y | y <- [0..length (head grid) - 1]] | x <- [0..length grid - 1]]
showRes res = [[if (x, y) `elem` res then 'X' else grid !! x !! y | y <- [0..length (head grid) - 1]] | x <- [0..length grid - 1]]

res_q1 :: Int -- count of visited cells
res_q1 = sum [1 | row <- grid', cell <- row, cell == 'X']
    where
        res = patrol' guard (0, -1)
        grid' = showRes res
module Main (main) where

import Options.Applicative
import Data.Monoid ((<>))

import Folgerhs.Protagonism (protagonism)
import Folgerhs.Presence (presence)
import Folgerhs.Groups (groupGraph)

data Config = Presence FilePath Float | Protagonism FilePath | GroupGraph FilePath

config :: Parser Config
config = hsubparser
       ( command "presence"
         ( info presenceConfig (progDesc "Line-by-line presence on stage") )
      <> command "groupgraph"
         ( info groupGraphConfig (progDesc "TODO") )
      <> command "protagonism"
         ( info protagonismConfig (progDesc "Speaker ratio per character") )
       )

presenceConfig :: Parser Config
presenceConfig = Presence
       <$> strArgument
            ( metavar "FILENAME"
           <> help "File to parse" )
       <*> option auto
            ( long "relevance"
           <> value 0
           <> metavar "RATIO"
           <> help "Minimum appearance ratio" )

protagonismConfig :: Parser Config
protagonismConfig = Protagonism
       <$> strArgument
            ( metavar "FILENAME"
           <> help "File to parse" )

groupGraphConfig :: Parser Config
groupGraphConfig = GroupGraph
       <$> strArgument
            ( metavar "FILENAME"
           <> help "File to parse" )

execute :: Config -> IO ()
execute (Presence f r) = presence f r
execute (Protagonism f) = protagonism f
execute (GroupGraph f) = groupGraph f

main :: IO ()
main = execParser opts >>= execute
    where
        desc = "Toolset for Folger Shakespeare Library's XML annotated plays"
        opts = info (helper <*> config) ( progDesc desc <> fullDesc )

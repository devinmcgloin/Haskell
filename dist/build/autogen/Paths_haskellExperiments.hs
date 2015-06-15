module Paths_haskellExperiments (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/devinmcgloin/Library/Haskell/bin"
libdir     = "/Users/devinmcgloin/Library/Haskell/ghc-7.8.3-x86_64/lib/haskellExperiments-0.1.0.0"
datadir    = "/Users/devinmcgloin/Library/Haskell/share/ghc-7.8.3-x86_64/haskellExperiments-0.1.0.0"
libexecdir = "/Users/devinmcgloin/Library/Haskell/libexec"
sysconfdir = "/Users/devinmcgloin/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskellExperiments_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskellExperiments_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskellExperiments_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskellExperiments_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskellExperiments_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

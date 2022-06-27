{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_HelloWorld (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/michel/Library/Haskell/bin"
libdir     = "/Users/michel/Library/Containers/com.haskellformac.Haskell.basic/Data/Library/Application Support/lib/ghc/HelloWorld-1.0-8LgNDDK3awEBuPMVsOvCwE-HelloWorld"
dynlibdir  = "/Users/michel/Library/Containers/com.haskellformac.Haskell.basic/Data/Library/Application Support/lib/ghc/HelloWorld-1.0-8LgNDDK3awEBuPMVsOvCwE-HelloWorld"
datadir    = "/Users/michel/Library/Containers/com.haskellformac.Haskell.basic/Data/Library/Application Support/share/HelloWorld-1.0"
libexecdir = "/Users/michel/Library/Containers/com.haskellformac.Haskell.basic/Data/Library/Application Support/libexec/x86_64-osx-ghc-8.6.4/HelloWorld-1.0"
sysconfdir = "/Users/michel/Library/Containers/com.haskellformac.Haskell.basic/Data/Library/Application Support/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HelloWorld_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HelloWorld_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HelloWorld_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HelloWorld_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HelloWorld_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HelloWorld_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

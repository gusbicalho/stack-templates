{-# LANGUAGE BlockArguments #-}
module PROJECTNAMESpec where

import Test.Hspec
import PROJECTNAME

spec :: Spec
spec = do
  describe "test" do
    it "works" $
      (1 :: Int) `shouldBe` 1

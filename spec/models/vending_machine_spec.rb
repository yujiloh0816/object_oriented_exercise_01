require 'rails_helper'

describe VendingMachine do

  describe "自動販売機で商品を購入" do
    context "商品が購入できる場合" do
      it "100円でダイエットコーラを買う(おつり 0円)" do


      end

      it "500円でコーラを買う(おつり 400円)" do

      end
    end

    context "商品が購入できない場合" do
      it "100円と500円以外の硬貨を投入する" do

      end

      it "売り切れの商品を選択する" do

      end

      it "500円を投入し、400円のお釣りがない" do

      end

    end

  end

end
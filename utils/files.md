# イメージ評価用のサンプルファイル集

## chk_package_load.R

- インストール済の全パッケージについて読み込みエラーがないか確認するスクリプト
- base R の機能で作成
- ~/library_test.csv としてテスト結果を出力する

## Image_test.Rmd

- 作成したイメージ検証用の RMarkdown document (html_document)
- rocker/tidyverse 内のパッケージを使用
- 内容：
    - PDF保存を前提に、メモ用のテキストエリアを最初に設置
    - セッション情報（{sessioninfo} パッケージ）
    - パッケージの読み込みテスト（chk_package_load.R と同様）
    - Python/TeXのインストール状況

## Image_test_mini.Rmd

- 上記を minidown::mini_document() を使って軽量化したもの

## tex_test.Rmd

- RMarkdown と XeLaTeX による日本語PDF作成のテスト
- 使用フォントは Noto Sans/Serif JP
- 内容：
    - 軸ラベルに日本語を使った base plot() の図
    - 軸ラベルに日本語を使った {ggplot2} の図
    - 難しい漢字を含む文章の例として、「平家物語」の冒頭

## typst_text.qmd

- Quarto と Typst による日本語PDF作成のテスト
- 使用フォントは本文で Noto Serif JP、見出しと図表で Noto Sans JP
- 内容：
    - 英文？として Lorem ipsum の冒頭 50 words（Typst の関数で lorem(50)）
    - 難しい漢字を含む文章の例として、「平家物語」の冒頭
    - TeX形式の数式と注釈の例
    - 軸ラベルに日本語を使った base plot() の図
    - 軸ラベルに日本語を使った {ggplot2} の図

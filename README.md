# protospace テーブル名とカラム名


  * usersテーブル
    - username :string
    - email :string
    - password :string
    - avatar :text
    - profile :text
    - member :string
    - works :text

  * commentsテーブル
    - review :text
    - user :references
    - prototype :references

  * prototypesテーブル
    - title :string
    - catch_copy :string
    - concept :text
    - user :references

  * prototype_imagesテーブル
    - prototype :references
    - image_url :text
    - role    :integer

  * like
    - prototype :references
    - user :references

## アソシエーション
  * user
    - has_many :comments
    - has_many :prototypes
    - has_many :likes

  * group
    - has_many :users

  * comment
    - belongs_to :user
    - belomgs_to :prototype

  * prototype
    - has_many :prototype_images
    - has_many :comments
    - has_many :likes
    - belongs_to :user

  * prototype_image
    - image :text
    - type :integer
    - belongs_to :prototype

  * like
    -belongs_to :user
    -belongs_to :prototype
# protospace テーブル名とカラム名


  * usersテーブル
    - usernamme :string
    - email
    - password
    - avator :text
    - profiel :text
    - group_id :integer

  * groupテーブル
    - group_name :string

  * commentsテーブル
    - review :text
    - user_id :integer
    - prototype_id :integer

  * prototypesテーブル
    - title  :string
    - catch_copy :string
    - concept  :text
    - user_id :integer

  * prototype_imagesテーブル
    - prototype_id

  * like
    - prototype_id
    - user_id

## アソシエーション
  * user
    - has_many :comments
    - has_many :prototypes
    - has_many :likes
    - belongs_to :group

  * group
    - has_many :users

  * comment
    - belongs_to :user
    - belomgs_to :prototypes

  * prototype
    - has_many :prototype_images
    - has_many :comments
    - has_many :likes
    - belongs_to :user

  * prototype_image
    - belongs_to :prototype

  * like
    -belongs_to :user
    -belongs_to :prototype
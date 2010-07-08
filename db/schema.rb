# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100708020003) do

  create_table "actividades", :force => true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.date     "fecha"
    t.string   "direccion"
    t.integer  "grupo_estudiantil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 25
    t.string   "type",              :limit => 25
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["assetable_id", "assetable_type", "type"], :name => "ndx_type_assetable"
  add_index "assets", ["assetable_id", "assetable_type"], :name => "fk_assets"
  add_index "assets", ["user_id"], :name => "fk_user"

  create_table "assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.string   "autor"
    t.string   "email"
    t.text     "texto"
    t.integer  "comentable_id"
    t.string   "comentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudiantes", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.integer  "universidad_id"
    t.string   "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inicial_segundo"
  end

  create_table "grupos_estudiantiles", :force => true do |t|
    t.string   "nombre"
    t.integer  "ano"
    t.integer  "universidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descripcion"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "mensajes", :force => true do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.integer  "emisor_id"
    t.integer  "receptor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.text     "descripcion"
    t.integer  "grupo_estudiantil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titulo"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  create_table "prints", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.string   "image_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representantes", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "grupo_estudiantil_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universidades", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "descripcion"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                   :null => false
    t.string   "email",                                   :null => false
    t.string   "crypted_password",                        :null => false
    t.string   "password_salt",                           :null => false
    t.string   "persistence_token",                       :null => false
    t.string   "single_access_token",                     :null => false
    t.string   "perishable_token",                        :null => false
    t.integer  "login_count",          :default => 0,     :null => false
    t.integer  "failed_login_count",   :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",               :default => false, :null => false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.integer  "grupo_estudiantil_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "original_file_name"
    t.string   "original_file_size"
    t.string   "original_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wysihat_files", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

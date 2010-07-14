require 'digest/sha1'

class Usuario < ActiveRecord::Base
  
  validates_presence_of   :nome
  validates_uniqueness_of :nome
  
  attr_accessor :confirmacao_de_senha
  validates_confirmation_of :senha
  
  validate :senha_nao_branco
  
  def self.autenticar(nome, senha)
    usuario = self.find_by_nome(nome)
    if usuario
      senha_esperada = senha_encryptada(senha, usuario.salt)
      if usuario.senha_hashed != senha_esperada
        usuario = nil
      end
    end
    usuario
  end
  
  # 'senha' é um atributo virtual
  def senha
    @senha
  end
  
  def senha=(snh)
    @senha = snh
    return if snh.blank?
    criar_novo_salt
    self.senha_hashed = Usuario.senha_encryptada(self.senha, self.salt)
  end
    
  private
  
  def senha_nao_branco
    errors.add(:senha, "Senha não preenchida") if senha_hashed.blank?
  end
  
  def self.senha_encryptada(senha, salt)
    string_to_hash = senha + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def criar_novo_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end

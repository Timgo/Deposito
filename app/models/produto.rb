# == Schema Information
# Schema version: 20100712175945
#
# Table name: produtos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  price       :decimal(8, 2)   default(0.0)
#

class Produto < ActiveRecord::Base
  has_many :pedidos, :through => :pedido_items
  has_many :pedido_items
  
  def self.encontrar_produtos_a_venda
    find(:all, :order => 'title')
  end
  
  validates_presence_of :title, :description, :image_url 
  validates_numericality_of :price 
  validates_length_of :description,
                      :minimum => 10,
                      :message => 'mínimo 10 caracteres'
  validate :price_must_be_at_least_a_cent 
  validates_uniqueness_of :title 
  validates_format_of :image_url,
                      :with	=> %r{\.(gif|jpg|png|jpeg)$}i, 
                      :message => 'deve ser um endereço para imagem GIF, JPEG, JPG ou PNG.'
                      
  
  protected
  def price_must_be_at_least_a_cent
    errors.add( :price, 'deve ser no mínimo um 0.01') if price.nil? || price < 0.01
  end
end

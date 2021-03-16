class Book < ApplicationRecord
    #belongs_to :author
    validates :title, presence: {message: 'Judul harus diisi'}
    validates :description, length: {minimum: 10, message: 'Minimal 10 huruf'}
    validates :page, numericality: {greater_than: 10, message: 'Halaman harus lebih dari 10'}
    def self.expensive
        where('price > 150000')
    end
    def self.cheap
        where('price < 150000')
    end
    def self.price_equal_more(price)
    where('price >= ?', price)
    end
end
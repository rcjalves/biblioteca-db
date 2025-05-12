-- Inserindo usuários
INSERT INTO usuarios (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '(11) 98765-4321'),
('Maria Oliveira', 'maria.oliveira@email.com', '(21) 99876-5432'),
('Carlos Souza', 'carlos.souza@email.com', '(31) 98765-1234');

-- Inserindo livros
INSERT INTO livros (titulo, autor, ano_publicacao, genero, isbn) VALUES
('Dom Casmurro', 'Machado de Assis', 1899, 'Romance', '9788535910663'),
('1984', 'George Orwell', 1949, 'Ficção Científica', '9788522106169'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Literatura Infantil', '9788595081512'),
('A Revolução dos Bichos', 'George Orwell', 1945, 'Fábula', '9788535909555'),
('Cem Anos de Solidão', 'Gabriel García Márquez', 1967, 'Realismo Mágico', '9788501016074');

-- Inserindo empréstimos
INSERT INTO emprestimos (livro_id, usuario_id, data_devolucao_prevista, status) VALUES
(2, 1, datetime('now', '+14 days'), 'ativo'),
(4, 3, datetime('now', '+14 days'), 'ativo'),
(1, 2, datetime('now', '+7 days'), 'ativo');
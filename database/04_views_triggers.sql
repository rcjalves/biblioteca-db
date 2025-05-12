-- View para livros mais emprestados
CREATE VIEW livros_mais_emprestados AS
SELECT l.id, l.titulo, l.autor, COUNT(e.id) AS total_emprestimos
FROM livros l
LEFT JOIN emprestimos e ON l.id = e.livro_id
GROUP BY l.id
ORDER BY total_emprestimos DESC;

-- View para usuários mais ativos
CREATE VIEW usuarios_mais_ativos AS
SELECT u.id, u.nome, COUNT(e.id) AS total_emprestimos
FROM usuarios u
LEFT JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.id
ORDER BY total_emprestimos DESC;
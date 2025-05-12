-- 1. Listar todos os livros disponíveis
SELECT * FROM livros WHERE disponivel = 1;

-- 2. Listar livros emprestados no momento
SELECT l.titulo, u.nome, e.data_emprestimo, e.data_devolucao_prevista
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
JOIN usuarios u ON e.usuario_id = u.id
WHERE e.status = 'ativo';

-- 3. Buscar empréstimos atrasados
SELECT l.titulo, u.nome, e.data_devolucao_prevista,
       julianday('now') - julianday(e.data_devolucao_prevista) AS dias_atraso
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
JOIN usuarios u ON e.usuario_id = u.id
WHERE e.status = 'ativo' AND e.data_devolucao_prevista < date('now');

-- 4. Atualizar status para atrasado (deve ser executado periodicamente)
UPDATE emprestimos
SET status = 'atrasado'
WHERE status = 'ativo' AND data_devolucao_prevista < date('now');

-- 5. Registrar devolução de livro
UPDATE emprestimos
SET status = 'finalizado',
    data_devolucao_real = CURRENT_TIMESTAMP
WHERE id = 1;

UPDATE livros
SET disponivel = 1
WHERE id = (SELECT livro_id FROM emprestimos WHERE id = 1);
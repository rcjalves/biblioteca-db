<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Sistema completo de gerenciamento de biblioteca com SQLite. Inclui scripts SQL, estrutura do projeto e diagrama ER.">
</head>
<body>
  <header>
    <h1>Sistema de Biblioteca com SQLite</h1>
    <div class="badge badge-sql">SQLite</div>
    <div class="badge badge-db">Database</div>
    <p>Gerencie usuários, livros e empréstimos com um banco de dados leve e eficiente.</p>
  </header>
  <section id="estrutura">
    <h2>📁 Estrutura do Projeto</h2>
    <div class="file-structure">
      biblioteca-sqlite/<br>
      ├── database/<br>
      │   ├── 01_create_tables.sql<br>
      │   ├── 02_sample_data.sql<br>
      │   ├── 03_queries.sql<br>
      │   ├── 04_views_triggers.sql<br>
      │   └── biblioteca.db<br>
      ├── docs/<br>
      │   ├── diagrama.html<br>
      │   └── diagrama.png<br>
      └── README.html
    </div>
  </section>

  <section id="pre-requisitos">
    <h2>✅ Pré-requisitos</h2>
    <ul>
      <li><a href="https://sqliteonline.com/" target="_blank" rel="noopener noreferrer">SQLite Online</a> ou</li>
      <li>SQLite instalado localmente</li>
    </ul>
  </section>

  <section id="configuracao">
    <h2>⚙️ Configuração</h2>
    <div class="step">Clone o repositório:</div>
    <pre><code>git clone https://github.com/seu-usuario/biblioteca-sqlite.git
cd biblioteca-sqlite</code></pre>
  </section>

  <section id="uso">
    <h2>🚀 Como Usar</h2>
    <div class="step">Execute os scripts na seguinte ordem:</div>
    <pre><code>.read database/01_create_tables.sql
.read database/02_sample_data.sql
.read database/03_queries.sql
.read database/04_views_triggers.sql</code></pre>
  </section>

  <section id="scripts">
    <h2>📜 Scripts SQL</h2>
    <article>
  <h3>Livros disponíveis</h3>
  <pre><code>SELECT * FROM livros WHERE disponivel = 1;</code></pre>
</article>

<article>
  <h3>Empréstimos ativos</h3>
  <pre><code>SELECT l.titulo, u.nome, e.data_emprestimo, e.data_devolucao_prevista
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
JOIN usuarios u ON e.usuario_id = u.id
WHERE e.status = 'ativo';</code></pre>
</article>

<article>
  <h3>Registrar devolução</h3>
  <pre><code>UPDATE emprestimos
SET status = 'finalizado',
    data_devolucao_real = CURRENT_TIMESTAMP
WHERE id = 1;

UPDATE livros
SET disponivel = 1
WHERE id = (SELECT livro_id FROM emprestimos WHERE id = 1);</code></pre>
</article>

<div class="warning">
  <strong>Importante:</strong> Triggers já automatizam grande parte dessas ações. Os exemplos são para fins educacionais.
</div>
  </section>

  <section>
    <h2>📊 Diagrama do Banco de Dados</h2>
    <p>Consulte o <a href="docs/diagrama.png">diagrama ER interativo</a> para melhor entendimento.</p>
  </section>
</body>
</html>

enum RepositoryErrorMessages {
  fetchAll('Erro ao buscar Alunos.'),
  fetchById('Erro ao buscar o Aluno.'),
  saving('Erro ao salvar o cadastro.'),
  insert('Erro ao cadastrar o Aluno.'),
  update('Erro ao editar o Aluno.'),
  delete('Erro ao deletar o Aluno.'),
  notFound('Aluno não foi encontrado.');

  final String message;

  const RepositoryErrorMessages(this.message);
}

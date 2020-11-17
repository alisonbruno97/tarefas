package com.qintess.tarefas.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.qintess.tarefas.entidades.Tarefa;

public interface TarefaRepository extends CrudRepository<Tarefa, Integer> {
	
	List<Tarefa> findByFinalizado(boolean finalizado);

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Grupo
    {
        #region Atributos

        private int idGrupo;
        private int idMateria;
        private int idDocente;
        private DateTime gestion;
        private string grupo;
        private int estado;
        private int concurrencia;

        #endregion

        #region Metodos
        public int IdGrupo
        {
            get { return idGrupo; }
            set { idGrupo = value; }
        }
        
        public int IdMateria
        {
            get { return idMateria; }
            set { idMateria = value; }
        }
        
        public int IdDocente
        {
            get { return idDocente; }
            set { idDocente = value; }
        }
       
        public DateTime Gestion
        {
            get { return gestion; }
            set { gestion = value; }
        }
        
        public string Grupo1
        {
            get { return grupo; }
            set { grupo = value; }
        }
       
        public int Estado
        {
            get { return estado; }
            set { estado = value; }
        }
        

        public int Concurrencia
        {
            get { return concurrencia; }
            set { concurrencia = value; }
        }
        #endregion

    }
}

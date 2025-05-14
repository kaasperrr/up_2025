using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Proizvodstvo
{
    public int IdProizvodstvo { get; set; }

    public string? NameProizvodstvo { get; set; }

    public virtual ICollection<Produkcium> Produkcia { get; set; } = new List<Produkcium>();

    public virtual ICollection<Sotrudnik> Sotrudniks { get; set; } = new List<Sotrudnik>();
}

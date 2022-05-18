### A Pluto.jl notebook ###
# v0.19.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 97506e1e-4ad1-45f2-a626-b93f05bba4a4
let
	using PlutoUI
	TableOfContents()
end

# ╔═╡ 4a9c5850-f811-43ff-859c-2f7c69c001b3
html"<button onclick='present()'>present</button>"

# ╔═╡ 65a9bcd2-d4f3-11ec-0cb0-ef5e13a5be35
md"""
# Ultra-Low Frequency Plasma Waves in Earth’s Magnetosphere
# What is Plasma

A plasma is a **quasineutral** gas of charged and neutral particles which exhibits
**collective** behavior.

Requirements:
- Size: $\lambda_D \ll L$
- Density: $N_D \ggg 1$
- Time: $\omega \tau > 1$

## Quasineutral

- $n_i\simeq n_e \simeq n$ where n is plasma density
- Not so neutral that all the interesting electromagnetic forces vanish.
- A fundamental characteristic of plasma is its ability to shield out external electric potentials.

```math
\lambda_D \equiv \sqrt{\frac{\epsilon k_B T_e}{ne^2}} \ll L
```

![Debye shielding](https://cds.cern.ch/record/2203630/files/Debye_probes.png)

## Collective

![Coulomb force](https://d3i71xaburhd42.cloudfront.net/cc02b06c3bb76450a1abad0d91b8d4f1ef5adfde/3-Figure1-1-1.png)

Because of collective behavior, a plasma does not tend to conform to external influences; rather, it often behaves as if it had a mind of its own.

Let $N_D$ be the number of particles in a Debye sphere, we require
```math
N_D \ggg 1
```

## Collisionless

If $\omega$ is the frequency of typical plasma oscillations and $\tau$ is the mean time between collisions with neutral atoms, we require

```math
\omega \tau > 1
```
"""

# ╔═╡ 2ea7aaac-ec4b-43c5-a9aa-2c4e6450205c
md"""
## Single Particle Motions

- Plasmas behave sometimes like fluids, and sometimes like a collection of individual particles.
- Wave-particle interactions

`motion_type = ` $(@bind motion_type html"<select><option value='1'>Electrons</option><option value='2'>Electron and ion</option><option value='3'>Ion in Earth-like dipole</option></select>")
"""

# ╔═╡ 9d7d801b-fc49-43f2-a9c6-fcb058be7e90
let
	if motion_type == "1"
		md"
![Electrons in a uniform EM field](https://henry2004y.github.io/TestParticle.jl/dev/figures/electrons_uniformEM.png)"
	elseif motion_type == "2"
		md"
![Electron and proton in a uniform EM field](https://henry2004y.github.io/TestParticle.jl/dev/figures/electron_ion_uniformEM.png)"
	elseif motion_type == "3"
		md"
![Adiabatic invariants](https://henry2004y.github.io/TestParticle.jl/dev/figures/ion_trajectory_dipole.png)"
	end
end

# ╔═╡ a7661255-ca7f-43d7-a755-687645632e04
md"
## Governing Equations

### Conservation Laws
```math
\begin{align}
\frac{\partial\rho}{\partial t} &= -\nabla\cdot(\rho\mathbf{u})\quad&\text{Mass Conservation} \\
\rho\frac{d\mathbf{u}}{dt} &= -\nabla\cdot\overleftrightarrow{P} + \mathbf{j}\times\mathbf{B}\quad&\text{Momentum Conservation} \\
f(\rho,\mathbf{u},\overleftrightarrow{P}) &= 0 \quad&\text{Energy Conservation}
\end{align}
```

### Maxwell's Equations

```math
\begin{align}
\nabla\cdot\mathbf{E} &= \frac{\rho}{\epsilon_0}\quad &\text{Gauss law} \\
\nabla\cdot\mathbf{B} &= 0 \quad &\text{No magnetic monopole}\\
\nabla\times\mathbf{E} &= -\dot{\mathbf{B}} \quad &\text{Faraday's law}\\
\nabla\times\mathbf{B} &= \mu_0 \mathbf{j} + \mu_0\epsilon_0\dot{\mathbf{E}}\quad &\text{Ampère's law}
\end{align}
```

## Basic Ideas

- Fourier analysis
- Sinuisoidal eigenmodes with different frequencies $\omega$ and wavelengths $\lambda$
- **Small amplitude oscillations** $\rightarrow$ linear approximation

### Representation of Waves

Any sinuisoidally oscillating quantity can be represented as
```math
n = \bar{n} e^{i(\mathbf{k}\cdot\mathbf{r} - \omega t)}
```
where
- $\bar{n}$ is the amplitude of the wave
- $\mathbf{k}$ is the wave vector"

# ╔═╡ 4bbec8e0-9ff0-471f-b003-899a68452bb3
md"""
## Basic Wave Modes
`wave_type = ` $(@bind wave_type html"<select><option value='1'>Plasma oscillation</option><option value='2'>Lower hybrid drift wave</option><option value='3'>Whistler wave</option><option value='4'>Alfvén wave</option><option value='5'>Fast Magnetosonic wave</option></select>")
"""

# ╔═╡ e26bcb3e-6e94-44c8-9700-dfc194090004
if wave_type == "1"
	HTML("""<a href="https://gifyu.com/image/SseXb"><img src="https://s8.gifyu.com/images/plasma.gif" alt="plasma.gif" border="0" width="500"/></a>""")
elseif wave_type == "2"
	HTML("""<img src="https://s8.gifyu.com/images/lowerhybrid.gif" alt="lowerhybrid.gif" border="0" width="500">""")
elseif wave_type == "3"
	HTML("""<img src="https://s8.gifyu.com/images/whistler.gif" alt="whistler.gif" border="0" width="500">
	<h2>Whistler Waves</h2>
	<iframe width="700" height="315" src="https://www.youtube.com/embed/lZ5ZvVZ4jWk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>""")
elseif wave_type == "4"
	HTML("""<img src="https://s8.gifyu.com/images/alfven.gif" alt="alfven.gif" border="0" width="500">""")
elseif wave_type == "5"
	HTML("""<img src="https://s8.gifyu.com/images/fast.gif" alt="fast.gif" border="0" width="500">""")
end

# ╔═╡ 7e5d9d46-2838-4259-bc01-fdf1f7e1915a
md"## When Can We Obtain Simple Solutions?
- Small amplitude --> $\delta n / n \ll 1$
- Homogeneous --> $\nabla n \approx 0$
- Cold --> $T \approx 0$
- Isotropic --> $P = P_{xx} = P_{yy} = P_{zz}$
## When It Becomes Complicated
- Large amplitude --> Saturation, Steepening
- Inhomogeneous --> $\nabla n \neq 0, \nabla B \neq 0$
- Anisotropic --> $P_\perp \neq P_\parallel$


- No analytic solution is possible → **numerical models**.
- Often possible to understand a complex situation as a *modification* or *superposition* of basic modes of oscillation.

"

# ╔═╡ 17941264-becc-4bc5-b8b7-e1bdc90e0418
md"## What is Magnetosphere
![Magnetosphere](https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Structure_of_the_magnetosphere_LanguageSwitch.svg/1200px-Structure_of_the_magnetosphere_LanguageSwitch.svg.png)"

# ╔═╡ c99488fa-eb97-49d0-8bfe-662bad4fa5a1
HTML("""<h2>ULF Waves in Earth's Magnetosphere</h2>
    Typical ultra-low frequency range in magnetosphere physics: [0.01, 1] Hz
    <figure>
    <img src="https://usa.firenews.video/wp-content/uploads/2022/04/Cross-Energy-Couplings-via-Wave-Particle-Interactions-Schematic-777x586.jpg"
         alt="fast_EMIC_coupling">
    <figcaption>Hot ions (red) generate magnetosonic waves (MSWs; green), which then propagate across the field lines and heat up cold ions (yellow) by transferring their energy to them. A part of this transferred energy goes into generating EMIC waves (blue). Credit: © ERG Science Team</figcaption>
</figure>""")

# ╔═╡ c2e58f0b-02af-4d76-bd6b-9e81f998a053
md"## Modelling
### Plasma Hierarchy
![Plasma model classification](https://raw.githubusercontent.com/henry2004y/wave_workshop_helsinki/master/figures/plasma_model_classification.png)

### Vlasiator: Collisionless Hybrid Plasma Model
- Electrons as massless fluid
- Ions as phase space distribution functions"

# ╔═╡ 794f503f-8f9e-4a11-b223-7d07b6f59b96
md"## Vlasiator: 2D Results"

# ╔═╡ 274edc88-17fc-4ed7-8c76-14e5e83063a2
HTML(""" <video width="640" height="480" controls>
  <source src="https://helsinkifi.sharepoint.com/:v:/r/sites/SpacePhysics-ULFwaveteam/Shared%20Documents/General/ULF%20fluctuations/XZ_IMFpureBz_timevaryingRho/XZ_rho_b.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
<h2>Vlasiator: 2D Results</h2>
<video width="640" height="480" controls>
  <source src="https://helsinkifi.sharepoint.com/:v:/r/sites/SpacePhysics-ULFwaveteam/Shared%20Documents/General/ULF%20fluctuations/XZ_IMFpureBz_timevaryingRho/Movie3_poynting_inplane_bandhigh_log.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>""")

# ╔═╡ 78980638-58a1-43b9-a7f4-7d0f3b1ff0d6
md"
## Future Perspective: Multi-Scale Coupling
[![batsrus_amr.gif](https://s8.gifyu.com/images/batsrus_amr.gif)](https://gifyu.com/image/SxbuH)
## Future Perspective: Hierarchical Coupling
![Hierarchical coupling](https://www.frontiersin.org/files/Articles/396780/fphy-06-00113-HTML/image_m/fphy-06-00113-g001.jpg)
"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "a985dc37e357a3b22b260a5def99f3530fb415d3"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.2"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─4a9c5850-f811-43ff-859c-2f7c69c001b3
# ╟─97506e1e-4ad1-45f2-a626-b93f05bba4a4
# ╟─65a9bcd2-d4f3-11ec-0cb0-ef5e13a5be35
# ╟─2ea7aaac-ec4b-43c5-a9aa-2c4e6450205c
# ╟─9d7d801b-fc49-43f2-a9c6-fcb058be7e90
# ╟─a7661255-ca7f-43d7-a755-687645632e04
# ╟─4bbec8e0-9ff0-471f-b003-899a68452bb3
# ╟─e26bcb3e-6e94-44c8-9700-dfc194090004
# ╟─7e5d9d46-2838-4259-bc01-fdf1f7e1915a
# ╟─17941264-becc-4bc5-b8b7-e1bdc90e0418
# ╟─c99488fa-eb97-49d0-8bfe-662bad4fa5a1
# ╟─c2e58f0b-02af-4d76-bd6b-9e81f998a053
# ╟─794f503f-8f9e-4a11-b223-7d07b6f59b96
# ╟─274edc88-17fc-4ed7-8c76-14e5e83063a2
# ╟─78980638-58a1-43b9-a7f4-7d0f3b1ff0d6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

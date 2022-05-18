### A Pluto.jl notebook ###
# v0.19.4

using Markdown
using InteractiveUtils

# ╔═╡ 7c0bb60d-0cc5-4afb-9351-530bce5136bd
using PlutoUI

# ╔═╡ 0b8f8985-c388-45f4-9f47-1f36cd8596ca
TableOfContents()

# ╔═╡ d0ec4380-d4e3-11ec-298a-6bb1e3236dbd
md"# Waves in Plasmas

## Basic Concepts

- Fourier analysis
- Sinuisoidal eigenmodes with different frequencies $\omega$ and wavelengths $\lambda$
- **Small amplitude oscillation** $\rightarrow$ linear approximation

### Representation of Waves

Any sinuisoidally oscillating quantity can be represented as
```math
n = \bar{n} e^{i(\mathbf{k}\cdot\mathbf{r} - \omega t)}
```
where
- $\bar{n}$ is the amplitude of the wave
- $\mathbf{k}$ is the wave vector

### Dispersion relation

Dispersion relations describe the effect of dispersion on the properties of waves in a medium. A dispersion relation relates the wavelength or wavenumber of a wave to its frequency
```math
\omega = \omega(k)
```

- Phase velocities $v_p = \omega/k$
- Group velocities $v_g = d\omega/dk$

## Electrostatic Waves

$\mathbf{B}_1 = 0$, no fluctuating magnetic field $\rightarrow$ electrostatic

## Electromagnetic Waves
### Light Waves in a Vacuum
In a vacuum, $\mathbf{j} = 0$ and $\epsilon_0\mu_0 = c^{-2}$. The relevant Maxwell's equations are
```math
\begin{align}
\nabla\times\mathbf{E}_1 &= -\dot{\mathbf{B}_1} \\
c^2\nabla\times\mathbf{B}_1 &= \dot{\mathbf{E}_1}
\end{align}
```
Assuming plane waves varying as $e^{i(\mathbf{k}\cdot\mathbf{r} - \omega t)}$, we can get the dispersion relation
```math
\omega^2 = k^2c^2
```
where $c$ is the phase velocity $\omega/k$ of light waves.
### Plasma EM Waves

```math
\begin{align}
\nabla\times\mathbf{E}_1 &= -\dot{\mathbf{B}_1} \\
c^2\nabla\times\mathbf{B}_1 &= \frac{\mathbf{j}_1}{\epsilon_0} + \dot{\mathbf{E}_1}
\end{align}
```

### Plasma EM Waves, $\mathbf{B}_0 = 0$
In a plasma with $\mathbf{B}_0 = 0$, we must add a term $\mathbf{j}_1/\epsilon_0$ to Ampère's law to account for currents due to $1^{st}$ order charged particle motions:
```math
c^2\nabla\times\mathbf{B}_1 = \frac{\mathbf{j}_1}{\epsilon_0} + \dot{\mathbf{E}_1}
```
Again assuming an $e^{i(\mathbf{k}\cdot\mathbf{r} - \omega t)}$ dependence, for transverse waves $\mathbf{k}\cdot\mathbf{E}_1 = 0$,
```math
(\omega^2 - c^2k^2)\mathbf{E}_1 = -i\omega\mathbf{j}_1 / \epsilon_0
```
If we consider light waves or microwaves, these will be of such high frequency that the ions can be considered as fixed. The current $\mathbf{j}_1$ then comes entirely from electron motion. In the simplest form with no thermal motion, $T_e = 0$, we can get the dispersion relation for EM waves in a plasma with no dc B field
```math
\omega^2 = \omega_p^2 + c^2 k^2
```
There are several important properties:
- Phase velocity $v_p > c$, group velocity $v_g < c$
- Cutoff occurs at $k=0$ for a given frequency $\omega$; in other words, if $n$ is too large or $\omega$ is too small, an EM wave cannot pass through a plasma.
(TODO:ADD A FIGURE ABOUT SHORT-WAVE RADIO COMMUNICATION, Fig.4.32)

### EM Waves $\mathbf{k}\perp \mathbf{B}_0$

#### Ordinary Wave, $\mathbf{E}_1 \parallel \mathbf{B}_0$

```math
\omega^2 = \omega_p^2 + c^2 k^2
```

\"Ordinary\" means not affected by the presence of magnetic field.

#### Extraordinary Wave, $\mathbf{E}_1 \perp \mathbf{B}_0$

```math
\frac{c^2k^2}{\omega^2} = 1 - \frac{\omega_p^2}{\omega^2}\frac{\omega^2 - \omega_p^2}{\omega^2 - \omega_h^2}
```

It is an electromagnetic wave, partly transverse and partly longitudinal, with $\mathbf{k}\perp\mathbf{B}_0$ and $\mathbf{E}_1\perp\mathbf{B}_0$.

### EM Waves $\mathbf{k}\parallel \mathbf{B}_0$

```math
\begin{align}
\frac{c^2k^2}{\omega^2} = 1 - \frac{\omega_p^2/\omega^2}{1-(\omega_c/c)}\quad(\text{R wave}) \\
\frac{c^2k^2}{\omega^2} = 1 - \frac{\omega_p^2/\omega^2}{1+(\omega_c/c)}\quad(\text{L wave})
\end{align}
```
(TODO: ADD CIRCULAR POLARIZATION PLOT)

### Magnetohydrodynamic Waves

Low-frequency ($\omega^2 \ll \Omega_c^2$) ion oscillations ($m_e \ll m_i$) in the presence of a magnetic field

```math
-\mathbf{k}(\mathbf{k}\cdot\mathbf{E}_1) + k^2 \mathbf{E}_1 = \frac{\omega^2}{c^2}\mathbf{E}_1 + \frac{i\omega}{\epsilon_0 c^2}\mathbf{j}_1
```

The key in obtaining basic modes is the treatment of $\mathbf{j}_1$.

#### Alfvén Waves

$\mathbf{k}\parallel\mathbf{B}_0$

```math
\frac{\omega}{k} = \frac{B_0}{\sqrt{\mu_0 \rho}} \equiv v_A
```
where $v_A$ is a characteristic velocity at which perturbations of the magnetic field travel called **Alfvén velocity**.
(TODO: ADD GIF, INTRODUCE THE IDEA OF FROZEN-IN CONDITION)

#### Magnetosonic Waves

$\mathbf{k}\perp\mathbf{B}_0$

Since $\mathbf{E}_1\times\mathbf{B}_0$ drifts lie along $\mathbf{k}$, the plasma will be compressed and released in the course of the oscillation. As the name suggests, this wave mode is an extension of sonic waves caused by $\nabla p$, so we keep the pressure terms in the equation of motion.

The dispersion relation for the EM wave $\mathbf{k}\perp\mathbf{B}_0$ can be written as
```math
\frac{\omega^2}{k^2} = c^2\frac{v_s^2 + v_A^2}{c^2 + v_A^2}
```
Limiting cases:
- $\mathbf{B}_0\rightarrow 0, v_A\rightarrow 0$, ordinary ion acoustic wave
- $T\rightarrow 0, v_s\rightarrow 0$, modified Alfvén wave
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
# ╠═7c0bb60d-0cc5-4afb-9351-530bce5136bd
# ╟─0b8f8985-c388-45f4-9f47-1f36cd8596ca
# ╠═d0ec4380-d4e3-11ec-298a-6bb1e3236dbd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
